import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'auth_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FacebookAuthHandler extends AuthService {
  FacebookLogin _facebookLogin;
  final List<String> _permissions;

  FacebookAuthHandler(this._permissions) {
    _facebookLogin = FacebookLogin();
    _facebookLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
  }

  @override
  Future<bool> isLoggedIn() async {
    FacebookAccessToken token = await _facebookLogin.currentAccessToken;
    if (token == null)
      return false;
    else if (token.isValid()) {
      return _facebookLogin.isLoggedIn;
    }
    return false;
  }

  @override
  Future<bool> login([String name, String password]) async {
    FacebookLoginResult result = await _facebookLogin.logIn(_permissions);
    return result.status == FacebookLoginStatus.loggedIn;
  }

  @override
  Future<bool> logout() async {
    try {
      await _facebookLogin.logOut();
      return true;
    } catch (error) {
      return false;
    }
  }

  @override
  Future<bool> createAccount(String email, String password) {
    throw UnimplementedError();
  }

  @override
  String toString() {
    return "facebook";
  }

  Future<Map> getUserInfo() async {
    FacebookAccessToken token = await _facebookLogin.currentAccessToken;
    if (token != null && token.isValid()) {
      try {
        final resp = await (http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=$token'));
        return json.decode(resp.body);
      } catch (err) {
        return {};
      }
    }
    return {};
  }
}
