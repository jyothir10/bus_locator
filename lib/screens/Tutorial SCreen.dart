import 'package:bus_locator/Components/Constants.dart';
import 'package:bus_locator/Components/RoundedButton.dart';
import 'package:bus_locator/Components/TabBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class TutorialScreen extends StatefulWidget {
  static String id = 'Tutorial_Screen';
  @override
  _TutorialScreenState createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  String tutorial = "this is the tutorial to be displayed";
  //TODO : write the tutorial here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kPageBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.only(top: 20, bottom: 0, left: 20, right: 20),
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
            Column(
              children: <Widget>[
                Container(
                  width: 250.0,
                  height: 250.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        'assets/purple map.jpg',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Text(
                tutorial,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Center(
              child: DotsIndicator(
                dotsCount: 3,
                position: 1,
                decorator: DotsDecorator(
                  color: Colors.white,
                  activeColor: kBottomBarActiveIconColor,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 10, right: 12, left: 25),
                    child: RoundedButton(
                      color: kPageBackgroundColor,
                      text: "Skip",
                      textColor: Colors.white,
                      onPress: () {
                        //TODO: skip the tutorial
                         },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 10, left: 12, right: 25),
                    child: RoundedButton(
                      color: kBottomBarActiveIconColor,
                      text: "Next",
                      textColor: Colors.white,
                      onPress: () {
                        //TODO:goto next
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
