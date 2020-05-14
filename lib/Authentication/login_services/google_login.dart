import 'auth_service.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GoogleAuthHandler extends AuthService {
  GoogleSignIn _googleSignIn;
  FirebaseAuth _firebaseAuth;
  GoogleAuthHandler() {
    _googleSignIn = GoogleSignIn(signInOption: SignInOption.standard);
    _firebaseAuth = FirebaseAuth.instance;
  }

  @override
  Future<bool> isLoggedIn() {
    return _googleSignIn.isSignedIn();
  }

  @override
  Future<bool> login([String name, String password]) async {
    try {
      GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final FirebaseUser user =
          await _firebaseAuth.signInWithCredential(credential);
      return user != null;
    } catch (error) {
      return false;
    }
  }

  @override
  Future<bool> logout() async {
    try {
      await _googleSignIn.signOut();
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
    return "google";
  }
}
