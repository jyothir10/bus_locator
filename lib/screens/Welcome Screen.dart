import 'package:bus_locator/Authentication/ui/Register_screen.dart';
import 'package:bus_locator/Authentication/ui/login_page.dart';
import 'package:bus_locator/Authentication/ui/login_screen.dart';
import 'package:bus_locator/Components/Constants.dart';
import 'package:bus_locator/Components/RoundedButton.dart';
import 'package:bus_locator/Components/TabBar.dart';
import 'package:bus_locator/homePage.dart';
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
    Color buttonColor = Colors.white;
    Color buttonTextColor = kPageBackgroundColor;

    return Scaffold(
      body: Container(
        color: kPageBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        top: 20, bottom: 0, left: 20, right: 20),
                    child: new Image.asset(
                      'assets/ibus.png',
                      height: 250,
                      width: 200,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Text(
                      'I-BUS',
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8, bottom: 10, right: 12, left: 25),
                      child: RoundedButton(
                        color: buttonColor,
                        text: "Sign up",
                        textColor: buttonTextColor,
                        onPress: () {
                          Navigator.pushReplacementNamed(
                              context, TabBarClass.id);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8, bottom: 10, left: 12, right: 25),
                      child: RoundedButton(
                        color: buttonColor,
                        text: "Log in",
                        textColor: buttonTextColor,
                        onPress: () {
                          //TODO: implement login
                          Navigator.pushReplacementNamed(
                              context, TabBarClass.id);
                        },
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
