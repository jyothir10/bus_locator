import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  FirebaseAuth _auth;
  UserService() {
    _auth = FirebaseAuth.instance;
  }

  Future<Map> getUserProfile() async{
    try {
      FirebaseUser user = await _auth.currentUser();
      Map userInfo = {"name":user.displayName??"Person", "email": user.email??"xyz@email.com", "place": "Kannur"};
      return userInfo;
    } catch(error) {
      throw error;
    }
  }
}