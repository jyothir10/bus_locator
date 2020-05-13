import 'package:bus_locator/Authentication/ui/login_page.dart';
import 'package:bus_locator/Components/Constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:bus_locator/Components/BottomBar.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'Navigation/mapScreen.dart';

class HomePage extends StatelessWidget {
  static String id = 'Home_Screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.map),
        onPressed: () => Navigator.pushReplacementNamed(context, MapScreen.id),
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
          child: Stack(
        children: <Widget>[
          Container(
            height: 250,
            color: kBottomBarColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.play_circle_filled,
                          color: Colors.white30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Gotham',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          color: Colors.red,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Metropolis',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
