import 'dart:async';
//import 'package:jobfinder/Constant/Constant.dart';
import 'package:bus_locator/Authentication/ui/Register_screen.dart';
import 'package:bus_locator/Authentication/ui/login_page.dart';
import 'package:bus_locator/Authentication/ui/login_screen.dart';
import 'package:bus_locator/Components/TabBar.dart';
import 'package:bus_locator/screens/CartScreen.dart';
import 'package:bus_locator/screens/Welcome%20Screen.dart';
import 'package:bus_locator/Navigation/mapScreen.dart';
import 'package:bus_locator/screens/destination_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../homePage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bus_locator/Authentication/bloc/auth_bloc.dart';
import 'package:bus_locator/Authentication/bloc/auth_event.dart';
import 'package:bus_locator/Authentication/bloc/auth_state.dart';

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
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

//TODO: change route you want to.
  void navigationPage() {}

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    final _bloc = BlocProvider.of<AuthBloc>(context);
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 1));
    animation =
        new CurvedAnimation(parent: animationController, curve: Curves.easeOut);
    animation.addListener(() => this.setState(() {}));
    animationController.forward();
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _bloc.add(StartUp());
      }
    });
    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      child: Scaffold(
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
      ),
      listener: (BuildContext context, AuthState state) {
        if (state is StartUpAuthorised) {
          Navigator.pushReplacementNamed(context, TabBarClass.id);
        } else if (state is StartUpUnauthorised) {
          Navigator.pushReplacementNamed(context, WelcomeScreen.id);
        }
      },
    );
  }
}
