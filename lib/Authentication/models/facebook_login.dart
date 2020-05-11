import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter/material.dart';
class FacebookLoginHandler {
  FacebookLogin _facebookLogin;
  final String _successRoute;
  
  FacebookLoginHandler(this._successRoute) {
    _facebookLogin = FacebookLogin();
    _facebookLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
  }
  
  Future<void> login(List<String> permissions, BuildContext context) async {
    final result = await _facebookLogin.logIn(permissions);
    switch(result.status) {
      case FacebookLoginStatus.loggedIn:
        Navigator.pushReplacementNamed(context, this._successRoute);
        break;
      case FacebookLoginStatus.cancelledByUser:
        break;
      case FacebookLoginStatus.error:
        break;
    }
  }
}
