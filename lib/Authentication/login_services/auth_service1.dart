import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

enum AuthService { FACEBOOK, GOOGLE, EMAILANDPASSWORD }

class Auth {
  FirebaseAuth _auth;
  FacebookLogin _facebookLoginHandler;
  GoogleSignIn _googleLoginHandler;

  static const List<String> FACEBOOKPERMISSIONS = ["email"];

  Auth() {
    _auth = FirebaseAuth.instance;
  }

  Future<FirebaseUser> login(AuthService service,
      {String email, String password}) async {
    FirebaseUser user;
    try {
      if (service == AuthService.FACEBOOK) {
        user = await _facebookLogin();
      } else if (service == AuthService.GOOGLE) {
        user = await _googleLogin();
      } else if (service == AuthService.EMAILANDPASSWORD) {
        user = await _firebaseLogin(email: email, password: password);
      }
      return user;
    } catch (error) {
      throw error;
    }
  }

  Future<void> logout(AuthService service) async {
    try {
      if (service == AuthService.EMAILANDPASSWORD) {
        await _auth.signOut();
      } else if (service == AuthService.FACEBOOK) {
        await _facebookLoginHandler.logOut();
        await _auth.signOut();
      } else if (service == AuthService.GOOGLE) {
        await _googleLoginHandler.signOut();
        await _auth.signOut();
      }
    } catch (error) {
      throw error;
    }
  }

  Future<bool> isLoggedIn() async{
    FirebaseUser user = await _auth.currentUser();
    return user != null;
  }
  
  Future<FirebaseUser> currentUser() async {
    try {
    FirebaseUser user = await _auth.currentUser();
    return user;
    }
    catch(error) {
      throw Exception("User is not logged in.");
    }
  }

  Future<FirebaseUser> createAccount(String email, String password) async {
    try {
    final user = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    return user;
    } catch(error) {
      throw error;
    }

  }


  Future<FirebaseUser> _facebookLogin() async {
    _facebookLoginHandler = FacebookLogin();
    _facebookLoginHandler.loginBehavior = FacebookLoginBehavior.webViewOnly;
    final FacebookLoginResult result =
        await _facebookLoginHandler.logIn(FACEBOOKPERMISSIONS);
    if (result.status == FacebookLoginStatus.loggedIn) {
      try {
        final AuthCredential credential = FacebookAuthProvider.getCredential(
            accessToken: result.accessToken.token);
        final FirebaseUser user = await _auth.signInWithCredential(credential);
        return user;
      } catch (error) {
        await _facebookLoginHandler.logOut();
        throw error;
      }
    } else if (result.status == FacebookLoginStatus.cancelledByUser) {
      throw Exception("Login cancelled by user.");
    } else {
      throw Exception("Login error.");
    }
  }

  Future<FirebaseUser> _googleLogin() async {
    _googleLoginHandler = GoogleSignIn();
    GoogleSignInAccount googleSignInAccount =
        await _googleLoginHandler.signIn();
    if (googleSignInAccount != null) {
      try {
        GoogleSignInAuthentication googleAuth =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.getCredential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final FirebaseUser user = await _auth.signInWithCredential(credential);
        return user;
      } catch (error) {
        /// TODO (farih) Add better error handling for custom errors thrown by googleSignIn.
        await _googleLoginHandler.signOut();
        throw error;
      }
    } else {
      throw Exception("Login error");
    }
  }

  Future<FirebaseUser> _firebaseLogin(
      {@required String email, @required String password}) async {
    try {
      FirebaseUser user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return user;
    } catch (error) {
      throw Exception("Please check your email and password.");
    }
  }
}
