import 'package:bus_locator/Authentication/ui/login_page.dart';
import 'package:bus_locator/Components/Constants.dart';
import 'package:bus_locator/Components/TopNav.dart';
import 'package:bus_locator/screens/Bus%20Details%20Screen.dart';
import 'package:bus_locator/screens/Welcome%20Screen.dart';
import 'package:bus_locator/screens/ticket.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:bus_locator/Components/BottomBar.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Authentication/bloc/auth_bloc1.dart';
import 'Authentication/bloc/auth_event.dart';
import 'Components/customListTile.dart';
import 'Navigation/mapScreen.dart';

class HomePage extends StatefulWidget {
  static String id = 'Home_Screen';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controller;
  @override
  Widget build(BuildContext context) {
    String hintText1 = 'From';
    String hintText2 = "To";
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
                backgroundImage: NetworkImage(
                    'https://lh3.googleusercontent.com/a-/AOh14Gg0TXrSBWQ7kDpNr5O_krIyDL81ebh29ffFSVOf=s60-cc-rg'),
              ),
              decoration: BoxDecoration(color: Color(0xff13132d)),
            ),
            CustomListTile(
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
                  launch('mailto:hemakeralakecipe@gmail.com?subject=feedback'),
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
//      appBar: AppBar(
//        elevation: 1,
//        backgroundColor: kAppBarColor,
//        title: Center(
//          child: Text(
//            'Home',
//            style: TextStyle(
//              fontWeight: FontWeight.bold,
//            ),
//          ),
//        ),
//      ),
      body: SafeArea(
          child: ListView(
        children: <Widget>[
          TopNav(
            controller2: _controller,
            onPressed: () => Navigator.pushNamed(context, MapScreen.id),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                children: <Widget>[
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
                                  Icon(FontAwesomeIcons.searchLocation,
                                      size: 60),
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
                                Navigator.pushNamed(context, TicketScreen.id),
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
        ],
      )),
    );
  }
}

//  var alertStyle = AlertStyle(
//    overlayColor: kBottomBarInactiveIconColor,
//    animationType: AnimationType.fromTop,
//    isCloseButton: false,
//    isOverlayTapDismiss: false,
//    descStyle: TextStyle(fontWeight: FontWeight.bold),
//    animationDuration: Duration(milliseconds: 400),
//    alertBorder: RoundedRectangleBorder(
//      borderRadius: BorderRadius.circular(10.0),
//      side: BorderSide(
//        color: Colors.grey,
//      ),
//    ),
//    titleStyle: TextStyle(
//      color: Colors.red,
//    ),
//  );

//   Alert(
//    style: alertStyle,
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
