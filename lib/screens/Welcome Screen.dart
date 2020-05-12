import 'package:bus_locator/Components/Constants.dart';
import 'package:bus_locator/Components/RoundedButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bus_locator/Components/BottomBar.dart';
import 'package:bus_locator/Components/reusableCard.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'Welcome_Screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPageBackgroundColor,
      child: Column(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
                child: new Image.asset(
                  'assets/ibus.png',
                  height: 250,
                  width: 200,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
