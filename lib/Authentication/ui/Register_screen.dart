import 'package:flutter/material.dart';
import 'additionals.dart';

void main() => runApp(MaterialApp(
        home: SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: HexColor("#13132d"),
        body: RegisterScreen(),
      ),
    )));

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
              createInputCard("Name", 0, false),
              createLabel("Email", 0),
              createInputCard("Email", 0, false),
              createLabel("Password", 0),
              createInputCard("Password", 0, true),
              createLabel("Confirm Password", 0),
              createInputCard("Confirm Password", 0, true),
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
          createButton("Register"),
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
                          //TODO:add onpressed for GoogleButton
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
                      //TODO:add onpressed for FacebookButton
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
    );
  }
}
