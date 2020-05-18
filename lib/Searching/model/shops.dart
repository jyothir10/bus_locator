import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

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

    String string = await http.read("http://10.0.2.2:5000/?shop=$t");
    List shops = json.decode(string);
    return shops;
  }
}

