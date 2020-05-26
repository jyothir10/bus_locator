import 'package:bus_locator/Components/Constants.dart';
import 'package:bus_locator/Components/TabBar.dart';
import 'package:bus_locator/Components/TopNav.dart';
import 'package:bus_locator/Search/bloc/search_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bus_locator/Components/BusCard3.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'orderScreen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firestore = Firestore.instance;
final _auth = FirebaseAuth.instance;
FirebaseUser loggedInUser;
String selectedBus;
var busDetails;
var busData;
double latitude;
double longitude;
var currentPlace;
String rupee = '₹';
SearchBloc _searchBloc;
var id;

var alertStyle = AlertStyle(
  overlayColor: kPageBackgroundColor,
  animationType: AnimationType.fromTop,
  isCloseButton: false,
  isOverlayTapDismiss: false,
  descStyle: TextStyle(fontWeight: FontWeight.bold),
  animationDuration: Duration(milliseconds: 400),
  alertBorder: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10.0),
    side: BorderSide(
      color: Colors.grey,
    ),
  ),
  titleStyle: TextStyle(
    color: Colors.red,
  ),
);

class Destination extends StatefulWidget {
  static String id = 'Destination_Screen';
  @override
  _DestinationState createState() => _DestinationState();
}

class _DestinationState extends State<Destination> {
  final _auth = FirebaseAuth.instance;

  createDialogue(
    BuildContext context,
    String busname,
    String distance,
    String date,
    String id,
    String fare,
    String status,
    String type,
  ) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            elevation: 16,
            child: Container(
              decoration: BoxDecoration(
                color: kPageBackgroundColor,
                borderRadius: BorderRadius.circular(15.0),
              ),
              padding: EdgeInsets.all(10.0),
              height: 250,
              width: 360,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Add bus to cart ?',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 19),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FlatButton(
                        color: Colors.redAccent,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "yes",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ),
                        onPressed: () {
                          DocumentReference documentReference =
                              _firestore.collection('buses').document();
                          documentReference.setData({
                            'busname': busname,
                            'type': type,
                            'date': date,
                            'distance': distance,
                            'id': id,
                            'fare': fare,
                            'status': status,
                            'docId': documentReference.documentID,
                          });
                          Navigator.pop(context);
                        },
                      ),
                      FlatButton(
                        color: kBottomBarActiveIconColor,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "No",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  void getLocation() async {
    try {
      Position position = await Geolocator().getCurrentPosition(
          desiredAccuracy: LocationAccuracy.bestForNavigation);
      latitude = position.latitude;
      longitude = position.longitude;
      List<Placemark> placemark =
          await Geolocator().placemarkFromCoordinates(latitude, longitude);
      Placemark place = placemark[0];
      setState(() {
        currentPlace = place.locality;
      });
    } catch (e) {
      print(e);
      Alert(
        style: alertStyle,
        context: context,
        type: AlertType.error,
        title: 'Connection Error!',
        desc: 'Please turn on your network connection',
        buttons: [
          DialogButton(
            onPressed: () {
              //TODO:turn on the connection
              Navigator.pop(context);
            },
            color: kBottomBarColor,
            child: Text(
              'ok',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            width: 120,
          )
        ],
      ).show();
    }
  }

  Future getBusDetails(String busName) async {
    try {
      var querySnapshot = await _firestore
          .collection('bus')
          .where('busname', isEqualTo: busName)
          .getDocuments();
      final List<DocumentSnapshot> documents = querySnapshot.documents;

      for (var document in documents) {
        busDetails = document.data;
      }
      return busDetails;
    } catch (e) {
      print(e);
      return e;
    }
  }

  TextEditingController _controller;
  TextEditingController _controller2;

  Future<Null> refresh() async {
    await Future.delayed(
      Duration(seconds: 2),
    );
    setState(() {});
    return null;
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        id = loggedInUser.uid;
      }
    } catch (e) {
      print(e);
    }
  }

  void initState() {
    getCurrentUser();
    super.initState();
    getLocation();
    _controller = TextEditingController();
    _controller2 = TextEditingController();
    _searchBloc = SearchBloc();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: FlatButton(
          child: Icon(
            Icons.keyboard_backspace,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TabBarClass()));
          },
        ),
        backgroundColor: kAppBarColor,
        centerTitle: true,
        title: Text(
          'DESTINATION',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: kPageBackgroundColor,
            child: BlocBuilder<SearchBloc, SearchState>(
              bloc: _searchBloc,
              builder: (BuildContext context, SearchState state) {
                List<Widget> buses = [
                  TopNav(
                    hintText1: currentPlace,
                    controllerfrom: _controller,
                    controllerto: _controller2,
                    onChanged: (value) {
                      _searchBloc.add(SearchKeyPress(value));
                    },
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, TabBarClass.id),
                    icon: Icon(
                      Icons.compare_arrows,
                      size: 40,
                      color: kPageBackgroundColor,
                    ),
                  )
                ];
                if (state is SearchSuccess) {
                  final busesList = state.results;
                  if (busesList.length == 0) {
                    final busCard = BusCard3(
                      busName: "No data available",
                      busType: "--",
                      distance: "--",
                      fare: "--",
                      color: Colors.red,
                    );
                    buses.add(busCard);
                  } else {
                    for (var bus in busesList) {
                      final busName = bus["busname"];
                      final type = bus["bustype"];
                      final distance = bus["distance"];
                      final fare = bus["fare"];
                      final status = bus["status"];
                      final date = bus["date"];

                      final busCard = BusCard3(
                          busName: busName,
                          busType: type,
                          distance: distance,
                          fare: fare.toString(),
                          color: Colors.red,
                          onPress: () async {
                            busData = await getBusDetails(busName);
                            Navigator.pushNamed(context, OrderScreen.id);
                          },
                          onLongPress: () {
                            createDialogue(context, busName, distance, date, id,
                                fare, status, type);
                          });
                      buses.add(busCard);
                    }
                  }
                  return RefreshIndicator(
                    onRefresh: refresh,
                    child: ListView(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 20.0),
                      children: buses,
                    ),
                  );
                }
                return RefreshIndicator(
                  onRefresh: refresh,
                  child: ListView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                    children: buses,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
