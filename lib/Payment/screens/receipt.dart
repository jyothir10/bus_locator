import 'package:bus_locator/Authentication/ui/login_page.dart';
import 'package:bus_locator/Components/Constants.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:bus_locator/Components/BottomBar.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomePage extends StatelessWidget {
  final GoogleSignIn googleSignIn = new GoogleSignIn();

  static String id = 'Home_Screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff13132d),
      bottomNavigationBar: BottomBar(),
      body: SafeArea(
        child: Center(
          child: Stack(children: [
            Container(
              width: 250,
              height: 250,
              color: Colors.white,
            ),
            Container(
              color: Colors.yellow,
              width: 150,
              height: 150,
            ),
          ]),
        ),
      ),
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
