import 'auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthHandler extends AuthService {
  FirebaseAuth _auth;
  FirebaseAuthHandler() {
    _auth = FirebaseAuth.instance;
  }
  @override
  Future<bool> isLoggedIn() async {
    FirebaseUser currentUser = await _auth.currentUser();
    return currentUser != null;
  }

  @override
  Future<bool> login([String email, String password]) async {
    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return user != null;
    } catch (error) {
      return false;
    }
  }

  @override
  Future<bool> logout() async {
    try {
      await _auth.signOut();
      return true;
    } catch (error) {
      return false;
    }
  }

  Future<bool> passwordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return true;
    } catch (error) {
      return false;
    }
  }

  Future<bool> createAccount(String email, String password) async {
    try {
      FirebaseUser newUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return newUser != null;
    } catch (error) {
      return false;
    }
  }
}
