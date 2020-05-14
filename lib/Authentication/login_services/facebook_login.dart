import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'auth_service.dart';

class FacebookAuthHandler extends AuthService {
  FacebookLogin _facebookLogin;
  final List<String> _permissions;

  FacebookAuthHandler(this._permissions) {
    _facebookLogin = FacebookLogin();
    _facebookLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
  }


  @override
  Future<bool> isLoggedIn() {
    return _facebookLogin.isLoggedIn;
  }

  @override
  Future<bool> login([String name, String password]) async {
    FacebookLoginResult result = await _facebookLogin.logIn(_permissions);
    return result.status == FacebookLoginStatus.loggedIn;
  }

  @override
  Future<bool> logout() async {
    try{
    await _facebookLogin.logOut();
    return true;
    }
    catch(error) {
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

  
}
