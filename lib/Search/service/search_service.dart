import 'package:cloud_firestore/cloud_firestore.dart';

class SearchService {
  Future<List<DocumentSnapshot>> fetchBuses(String t) async {
    try {
    if (t == "") {
      return [];
    }

    var db = Firestore.instance;
    var query = await db.collection('bus').getDocuments();
    final List<DocumentSnapshot> buses = query.documents;
    List<DocumentSnapshot> availableBuses = [];
    buses.forEach((data) {
      if (data['end'] == t) {
        availableBuses.add(data);
      }
      var flag = 0;
      for (int i = 0; i < data['stops'].length; i++) {
        if (data['stops'][i] == t) {
          flag = 1;
          break;
        }
      }
      if (flag == 1) {
        availableBuses.add(data);
      }
    });
    //List buses = json.decode(string);
    return availableBuses;
    }catch(error) {
      throw error;
    }
  }
}