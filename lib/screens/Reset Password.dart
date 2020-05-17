import 'package:bus_locator/Authentication/bloc/auth_bloc1.dart';
import 'package:bus_locator/Authentication/bloc/auth_event.dart';
import 'package:bus_locator/Authentication/bloc/auth_state.dart';
import 'package:bus_locator/Authentication/ui/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:bus_locator/Components/Constants.dart';
import 'package:bus_locator/Authentication/ui/additionals.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPassword extends StatefulWidget {
  static String id = 'ResetPassword_Page';
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final oldPassword = InputCard("old password", 0, true);
  final newPassword = InputCard("new password", 0, true);
  final conNewPassword = InputCard("new password", 0, true);
  AuthBloc _authBloc;

  @override
  Widget build(BuildContext context) {
    _authBloc = BlocProvider.of<AuthBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.keyboard_backspace,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        child: SafeArea(
          child: Container(
            color: kPageBackgroundColor,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "Change Password",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      createLabel("Old Password", 0),
                      oldPassword,
                      createLabel("New Password", 0),
                      newPassword,
                      createLabel("Confirm New Password", 0),
                      conNewPassword,
                    ],
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12)),
                        child: FlatButton(
                          child: Text("Reset Password"),
                          color: HexColor("#693abd"),
                          textColor: Colors.white,
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.black,
                          padding: EdgeInsets.all(2.0),
                          splashColor: Colors.blueAccent,
                          onPressed: () {
                            _authBloc.add(ChangePassword(
                                oldPassword.controller.text,
                                newPassword.controller.text,
                                conNewPassword.controller.text));
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        listener: (BuildContext context, AuthState state) {
          stateListener(context, state);
        },
      ),
    );
  }

  void stateListener(BuildContext context, AuthState state) {
    if (state is ChangePasswordSuccess) {
      showInSnackBar(context, state.message);
      print(_authBloc);
      _authBloc.add(Logout());
    }
    else if (state is ChangePasswordFailure) {
      showInSnackBar(context, state.message);
    } 
    else if (state is LogoutSuccess) {
      Navigator.pushReplacementNamed(context, LoginScreen.id);
    }
  }
}
