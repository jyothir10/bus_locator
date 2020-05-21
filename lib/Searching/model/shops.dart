import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

//TODO Either change this model or build a new model
// Input the data type you want
// For search, list is better because of multiple entries
// If there are many entries consider limiting the size of the list
// Please add error handling for the query call otherwise the app can crash
class Shops {
  Future<List> fetchShop(String t) async {
    if(t == "") {
      return [];
    }

    var db= Firestore.instance;
    var query = db.collection('bus').getDocuments();

    final List<DocumentSnapshot> buses = query.documents;
    List available_buses = [];
    buses.forEach((data){
      if(data['end'] == t){
        avaiable_buses.add(json.decode(data));
        break;
      }
      var flag=0;
      for(int i=0;i< data['stops'].length;i++){
        if(data['stops'][i] == t){
          flag = 1;
          break;
        }
      }
      if(flag == 1){
        avaiable_buses.add(json.decode(data));
        break;
      }
    });
    //List buses = json.decode(string);
    return available_buses;
  }
}
