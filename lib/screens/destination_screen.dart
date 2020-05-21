import 'package:bus_locator/Components/Constants.dart';
import 'package:bus_locator/Components/TabBar.dart';
import 'package:bus_locator/Components/TopNav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bus_locator/Components/BusCard3.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'orderScreen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

final _firestore = Firestore.instance;
String selectedBus;
var busDetails;
var busData;
double latitude;
double longitude;
var currentPlace;

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

  void initState() {
    super.initState();
    getLocation();
    _controller = TextEditingController();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> buses = [
      TopNav(
        hintText1: currentPlace,
        controller2: _controller,
        onPressed: () =>
            Navigator.pushReplacementNamed(context, TabBarClass.id),
        icon: Icon(
          Icons.compare_arrows,
          size: 40,
          color: kPageBackgroundColor,
        ),
      )
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: Center(
          child: Text(
            'DESTINATION',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: kPageBackgroundColor,
            child: StreamBuilder(
                stream: _firestore.collection('bus').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      ),
                    );
                  }

                  final busesList = snapshot.data.documents;
                  for (var bus in busesList) {
                    final busName = bus.data['busname'];
                    final type = bus.data['bustype'];
                    final distance = bus.data['distance'];
                    final fare = bus.data['fare'];

                    final busCard = BusCard3(
                      busName: busName,
                      busType: type,
                      distance: distance,
                      fare: fare.toString(),
                      color: Colors.red,
                      onPress: () async {
                        busData = await getBusDetails(busName);
                        Navigator.pushNamed(context, OrderScreen.id);
                        print(busName);
                      },
                    );
                    buses.add(busCard);
                  }

                  return ListView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                    children: buses,
                  );
                }),
          ),
        ],
      ),
    );
  }
}
