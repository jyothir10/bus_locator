import 'dart:async';
//import 'package:jobfinder/Constant/Constant.dart';
import 'package:bus_locator/Authentication/ui/login_page.dart';
import 'package:bus_locator/screens/CartScreen.dart';
import 'package:bus_locator/screens/destination_Screen.dart';
import 'package:bus_locator/Navigation/mapScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../homePage.dart';

class AnimatedSplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<AnimatedSplashScreen>
    with SingleTickerProviderStateMixin {
  var _visible = true;

  AnimationController animationController;
  Animation<double> animation;

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

//TODO: change route you want to.
  void navigationPage() {
    Navigator.of(context).pushReplacementNamed(HomePage.id);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 2));
    animation =
        new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff13132d),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(bottom: 30.0),
                  child: new Image.asset(
                    'assets/ibus.png',
                    width: animation.value * 250,
                    height: animation.value * 250,
                  ))
            ],
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text('Powered by',
                  style: TextStyle(color: Colors.white, fontSize: 14)),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text('   Enfono Technologies',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
