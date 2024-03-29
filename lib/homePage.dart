import 'package:bus_locator/Components/Constants.dart';
import 'package:bus_locator/screens/BusDetailsScreen.dart';
import 'package:bus_locator/screens/CartScreen.dart';
import 'package:bus_locator/screens/WelcomeScreen.dart';
import 'package:bus_locator/screens/ticketList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Authentication/bloc/auth_bloc.dart';
import 'Authentication/bloc/auth_event.dart';
import 'Components/customListTile.dart';
import 'Navigation/mapScreen.dart';
import 'package:connectivity/connectivity.dart';
import 'Search/bloc/search_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

String val;
final _auth = FirebaseAuth.instance;
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

FirebaseUser loggedInUser;
var id;

class HomePage extends StatefulWidget {
  static String id = 'Home_Screen';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SearchBloc _searchBloc;
  double latitude;
  double longitude;
  var currentPlace;
  //TODO:current location
//  void getLocation() async {
//    try {
//      Position position = await Geolocator().getCurrentPosition(
//          desiredAccuracy: LocationAccuracy.bestForNavigation);
//      latitude = position.latitude;
//      longitude = position.longitude;
//
//      List<Placemark> placemark =
//          await Geolocator().placemarkFromCoordinates(latitude, longitude);
//      Placemark place = placemark[0];
//
//      setState(() {
//        currentPlace = place.locality;
//      });
//    } catch (e) {
//      print(e);
//      Alert(
//        style: alertStyle,
//        context: context,
//        type: AlertType.error,
//        title: 'Connection Error!',
//        desc: 'Please turn on your network connection',
//        buttons: [
//          DialogButton(
//            onPressed: () {
//              //TODO:turn on the connection
//              Navigator.pop(context);
//            },
//            color: kBottomBarColor,
//            child: Text(
//              'ok',
//              style: TextStyle(color: Colors.white, fontSize: 20),
//            ),
//            width: 120,
//          )
//        ],
//      ).show();
//    }
//  }

  //TODO:internet connection checking.
  void connectivityCheck() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      print('mobile');

      // I am connected to a mobile network.
    } else if (connectivityResult == ConnectivityResult.wifi) {
      print('wifi');

      // I am connected to a wifi network.
    } else {
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

//  TextEditingController _controller;
//  TextEditingController _controller2;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
//    getLocation();
    _searchBloc = SearchBloc();
//    _controller = TextEditingController();
//    _controller2 = TextEditingController();
    connectivityCheck();
  }

  @override
  void dispose() {
    // TODO: implement dispose
//    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final _bloc = BlocProvider.of<AuthBloc>(context);
    return Scaffold(
      drawer: Drawer(
        elevation: 10,
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                'Hello',
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              accountEmail: Text(
                'userEmail',
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: kPageBackgroundColor,
                backgroundImage: NetworkImage('photo'),
              ),
              decoration: BoxDecoration(color: Color(0xff13132d)),
            ),
            CustomListTile(
              onpress: () {
                //TODO:route
                Navigator.pushNamed(context, CartScreen.id);
              },
              leading: Icons.category,
              name: 'My Cart',
              icon: Icons.arrow_right,
            ),
            Divider(
              color: Colors.black,
              height: 5.0,
            ),
            CustomListTile(
                leading: Icons.reorder,
                name: 'Orders',
                icon: Icons.arrow_right,
                onpress: () {
                  //TODO:route
                  Navigator.pushNamed(context, BusDetails.id);
                }),
            Divider(
              color: Colors.black,
              height: 5.0,
            ),
            CustomListTile(
                leading: Icons.fiber_manual_record,
                name: 'How to use',
                icon: Icons.arrow_right,
                onpress: () {
                  //TODO:route
                }),
            Divider(
              color: Colors.black,
              height: 5.0,
            ),
            CustomListTile(
              leading: Icons.email,
              name: 'Contact us',
              icon: Icons.arrow_right,
              onpress: () =>
                  launch('mailto:buslocatorenfono@gmail.com?subject=feedback'),
            ),
            Divider(
              color: Colors.black,
              height: 5.0,
            ),
            CustomListTile(
              leading: Icons.lock_open,
              name: 'Logout',
              icon: Icons.arrow_right,
              onpress: () async {
                _bloc.add(Logout());
                await Navigator.pushReplacementNamed(context, WelcomeScreen.id);
              },
            ),
            Divider(
              color: Colors.black,
              height: 5.0,
            ),
          ],
        ),
      ),
      backgroundColor: kPageBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kAppBarColor,
        title: Text(
          'HOME',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, MapScreen.id);
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white70,
                          radius: 25,
                          child: Icon(
                            Icons.search,
                            size: 40,
                            color: kPageBackgroundColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5.0, 0, 0, 0),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(FontAwesomeIcons.bolt, size: 60),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Quick ticket',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                ),
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: [
                              BoxShadow(
                                color: kAppBarColor,
                                offset: Offset(0.0, 1.0),
                                blurRadius: 6.0,
                              )
                            ]),
                        height: 120,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(context, BusDetails.id),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(FontAwesomeIcons.searchLocation, size: 60),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Track Bus',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                  ),
                                ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(5.0),
                              boxShadow: [
                                BoxShadow(
                                  color: kAppBarColor,
                                  offset: Offset(0.0, 1.0),
                                  blurRadius: 6.0,
                                )
                              ]),
                          height: 120,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(context, TicketList.id),
                        child: Container(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(FontAwesomeIcons.moneyCheck, size: 60),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Wallet',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(5.0),
                              boxShadow: [
                                BoxShadow(
                                  color: kAppBarColor,
                                  offset: Offset(0.0, 1.0),
                                  blurRadius: 6.0,
                                )
                              ]),
                          height: 120,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(FontAwesomeIcons.ticketAlt, size: 60),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Book Tickets',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                ),
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: [
                              BoxShadow(
                                color: kAppBarColor,
                                offset: Offset(0.0, 1.0),
                                blurRadius: 6.0,
                              )
                            ]),
                        height: 120,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5.0, 0, 5, 0),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(FontAwesomeIcons.tag, size: 60),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Offers',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                ),
                              ),
                            )
                          ],
                        ),
                        height: 110,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: [
                              BoxShadow(
                                color: kAppBarColor,
                                offset: Offset(0.0, 1.0),
                                blurRadius: 6.0,
                              )
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//
//   Alert(
//
//    type: AlertType.error,
//    title: title,
//    desc: description,
//    buttons: [
//      DialogButton(
//        color: kBottomBarColor,
//        child: Text(
//          buttonText,
//          style: TextStyle(color: Colors.white, fontSize: 20),
//        ),
//        width: 120,
//      )
//    ],
//  ).show();
