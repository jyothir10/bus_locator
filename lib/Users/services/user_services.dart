import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  FirebaseAuth _auth;
  Firestore _db;
  UserService() {
    _auth = FirebaseAuth.instance;
    _db = Firestore.instance;
  }

  Future<Map> getUserProfile() async{
    try {
      FirebaseUser user = await _auth.currentUser();
      var displayName = user.displayName;
      var query = await _db.collection('directory').document(user.email).get();
      // query.get().then((datasnapshot) {
      //   if (datasnapshot.exists) {
      //     displayName = datasnapshot.data['name'];
      //   }
      // });
      if (query.exists) {
        displayName = query.data["name"];
        print("QUERY " + query.data.toString());
      }
      print(user);
      Map userInfo = {"name":displayName??"Person", "email": user.email??"xyz@email.com", "place": "Kannur"};
      return userInfo;
    } catch(error) {
      throw error;
    }
  }
}