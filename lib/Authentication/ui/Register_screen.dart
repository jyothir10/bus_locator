import 'dart:async';

import 'package:flutter/material.dart';
import '../bloc/auth_event.dart';
import '../login_services/facebook_login.dart';
import '../login_services/firebase_login.dart';
import '../login_services/google_login.dart';
import 'additionals.dart';
import 'package:bus_locator/Authentication/bloc/auth_bloc1.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bus_locator/Authentication/bloc/auth_event.dart';
import 'package:bus_locator/Authentication/bloc/auth_state.dart';

void main() => runApp(MaterialApp(
        home: SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: HexColor("#13132d"),
        body: RegisterScreen(),
      ),
    )));

class RegisterScreen extends StatefulWidget {
  static String id = 'Register_Screen';
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  AuthBloc _bloc;
  final InputCard name = InputCard("Name", 0, false);
  final InputCard email = InputCard("Email", 0, false);
  final InputCard password = InputCard("Password", 0, true);
  final InputCard confirmPassword = InputCard("Confirm Password", 0, true);
  void initState() {
    super.initState();
    // TODO Change this after testing
    _bloc = AuthBloc();
  }

  void dispose() {
    _bloc.close();
    super.dispose();
  }

  void showInSnackBar(String value) {
    FocusScope.of(context).requestFocus(new FocusNode());
    new SnackBar(
      content: new Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontFamily: "WorkSansSemiBold"),
      ),
      backgroundColor: Colors.blue,
      duration: Duration(seconds: 3),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Register",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Login",
                  style: TextStyle(
                      color: HexColor("#693ebd"),
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                createLabel("Name", 0),
                name,
                createLabel("Email", 0),
                email,
                createLabel("Password", 0),
                password,
                createLabel("Confirm Password", 0),
                confirmPassword,
              ],
            ),
            Center(
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: HexColor("#ae67d5")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Container(
                width: double.infinity,
                height: 50,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12)),
                child: FlatButton(
                  color: HexColor("#693abd"),
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(2.0),
                  splashColor: Colors.blueAccent,
                  onPressed: () {
                    registerCallback(
                        name.controller.text,
                        password.controller.text,
                        confirmPassword.controller.text);
                  },
                  child: Container(
                    width: 200,
                    child: Center(
                      child: Text(
                        "Register",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      height: 1.0,
                      color: HexColor("#38385c"),
                    ),
                  ),
                ),
                Text("Or login with",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17)),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      height: 1.0,
                      color: HexColor("#38385c"),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: Card(
                        color: Colors.red,
                        child: FlatButton(
                          onPressed: () {
                            // Facebook Login
                            _bloc.add(
                                InjectService(FacebookAuthHandler(["email"])));
                            _bloc.add(Login());
                          },
                          child: Text(
                            "Google",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ))),
                Expanded(
                  child: Card(
                    color: Colors.blue,
                    child: FlatButton(
                      onPressed: () {
                        // Google Login
                        _bloc.add(InjectService(GoogleAuthHandler()));
                        _bloc.add(Login());
                      },
                      child: Text("FaceBook",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17)),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void registerCallback(String email, String password, String confirmPassword) {
    _bloc.add(InjectService(FirebaseAuthHandler()));
    _bloc.add(CreateAccount(
        email: email, password: password, confirmPassword: confirmPassword));
  }
}
