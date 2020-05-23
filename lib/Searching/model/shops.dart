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
    RegExp type = new RegExp(r"{$t}.*" , caseSensitive:false , multiLine:false);
    var db= Firestore.instance;
    var query = await db.collection('bus').getDocuments();

    final List<DocumentSnapshot> buses = query.documents;
    List available_buses = [];
    if (buses.isEmpty) {
      return [];
    }
    buses.forEach((data){
      //if(data['end'] == ){
      if(type.hasMatch(data['end'])) {
        available_buses.add(data);
      }
      var flag=0;
      for(int i=0;i< data['stops'].length;i++){
        //if(data['stops'][i] == t){
        if(type.hasMatch(data['stops'][i])) {
          flag = 1;
          break;
        }
      }
      if(flag == 1){
        available_buses.add(data);
      }
    });
    //List buses = json.decode(string);
    return available_buses;
  }
}
