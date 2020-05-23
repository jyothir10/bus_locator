import 'package:cloud_firestore/cloud_firestore.dart';

class SearchService {
  Future<List<DocumentSnapshot>> fetchBuses(String t) async {
    if (t == "") {
      return [];
    }
    RegExp type = new RegExp('^$t.*\$', caseSensitive: false, multiLine: false);
    var db = Firestore.instance;
    var query = await db.collection('bus').getDocuments();

    final List<DocumentSnapshot> buses = query.documents;
    List<DocumentSnapshot> availableBuses = [];
    if (buses.isEmpty) {
      return [];
    }
    buses.forEach((data) {
      //if(data['end'] == ){
      if (type.hasMatch(data['end'])) {
        availableBuses.add(data);
      }
      var flag = 0;
      for (int i = 0; i < data['stops'].length; i++) {
        //if(data['stops'][i] == t){
        if (type.hasMatch(data['stops'][i])) {
          flag = 1;
          break;
        }
      }
      if (flag == 1) {
        availableBuses.add(data);
      }
    });
    print(availableBuses);
    //List buses = json.decode(string);
    return availableBuses;
  }
}
