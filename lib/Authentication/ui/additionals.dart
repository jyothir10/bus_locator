import 'package:bus_locator/Components/TabBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bus_locator/Authentication/bloc/auth_bloc1.dart';
import 'package:bus_locator/Authentication/bloc/auth_state.dart';
import 'package:bus_locator/Authentication/bloc/auth_event.dart';
import 'package:bus_locator/main.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

Card createInputCard(String hintText, double horizontal, bool obscureText) {
  return Card(
    margin: EdgeInsets.symmetric(vertical: 5, horizontal: horizontal),
    color: HexColor("#38385c"),
    child: TextFormField(
      obscureText: obscureText,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: "$hintText",
        contentPadding: EdgeInsets.all(15.0),
        border: InputBorder.none,
        filled: true,
      ),
    ),
  );
}

Padding createLabel(String label, double horizontal) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 5, horizontal: horizontal),
    child: Text(
      "$label",
      style: TextStyle(
          color: HexColor("#ae67d6"),
          fontWeight: FontWeight.bold,
          fontSize: 15),
    ),
  );
}

Padding createButton(String label) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
    child: Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: FlatButton(
        color: HexColor("#693abd"),
        textColor: Colors.white,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        padding: EdgeInsets.all(2.0),
        splashColor: Colors.blueAccent,
        onPressed: (){},
        child: Container(
          width: 200,
          child: Center(
            child: Text(
              "$label",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    ),
  );
}

class Label extends StatelessWidget {
  final String label;
  final double horizontal;
  const Label(this.label, this.horizontal);

  @override
  Widget build(BuildContext context) {
    return createLabel(this.label, this.horizontal);
  }
}

class InputCard extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  TextEditingController get controller => _controller;
  final String hintText;
  final double horizontal;
  final bool obscureText;
  InputCard(this.hintText, this.horizontal, this.obscureText, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: horizontal),
      color: HexColor("#38385c"),
      child: TextFormField(
        obscureText: obscureText,
        controller: _controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: "$hintText",
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
        ),
      ),
    );
  }
}

Padding createSignUpButton(String email, String password, String confirmpassword, Function callback) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
    child: Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: FlatButton(
        color: HexColor("#693abd"),
        textColor: Colors.white,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        padding: EdgeInsets.all(2.0),
        splashColor: Colors.blueAccent,
        onPressed: callback(email, password, confirmpassword),
        child: Container(
          width: 200,
          child: Center(
            child: Text(
              "Sign Up",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    ),
  );
}

void showInSnackBar(BuildContext context, String value) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
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
      ),
    );
  }

      void stateListener(BuildContext context, AuthState state) {
    if (state is LoginSuccess) {
      Navigator.pushReplacementNamed(context, TabBarClass.id);
      showInSnackBar(context, state.message);
    } else if (state is LoginFailure) {
      showInSnackBar(context, state.message);
    } else if (state is AuthLoading) {
      //TODO Put progress bar
    } else if (state is CreateAccountSuccess) {
      showInSnackBar(context, state.message);
    } else if (state is CreateAccountFailure) {
      showInSnackBar(context, state.message);
    }
  }

