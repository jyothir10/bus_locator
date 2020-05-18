import 'package:bus_locator/Authentication/login_services/auth_service1.dart';
import 'package:bus_locator/Authentication/ui/Register_screen.dart';
import 'package:bus_locator/Components/Constants.dart';
import 'package:flutter/material.dart';
import 'additionals.dart';
import 'package:bus_locator/Authentication/bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bus_locator/Authentication/bloc/auth_event.dart';
import 'package:bus_locator/Authentication/bloc/auth_state.dart';

class LoginScreen extends StatelessWidget {
  static const String id = "Login_Screen";
  LoginScreen({Key key}) : super(key: key);

  final email = InputCard("email", 0, false);
  final password = InputCard("password", 0, true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: kPageBackgroundColor,
      body: BlocListener<AuthBloc, AuthState>(
        child: loginScreenUI(context),
        listener: stateListener,
      ),
    );
  }

  Widget loginScreenUI(BuildContext context) {
    final _bloc = BlocProvider.of<AuthBloc>(context);
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
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushReplacementNamed(
                      context, RegisterScreen.id),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: HexColor("#693ebd"),
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                createLabel("Email", 0),
                email,
                createLabel("Password", 0),
                password,
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
                  child: Text("Login"),
                  color: HexColor("#693abd"),
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(2.0),
                  splashColor: Colors.blueAccent,
                  onPressed: () {
                    _bloc.add(Login(AuthService.EMAILANDPASSWORD,
                        email: email.controller.text,
                        password: password.controller.text));
                  },
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
                            _bloc.add(Login(AuthService.GOOGLE));
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
                        _bloc.add(Login(AuthService.FACEBOOK));
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
}
