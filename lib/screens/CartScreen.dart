import 'package:flutter/material.dart';
import 'package:bus_locator/Components/Constants.dart';
import 'package:bus_locator/Components/BusCard4.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'BusDetailsScreen.dart';

final _firestore = Firestore.instance;
var busDetails;
var busData;
String rupee = '₹';

class CartScreen extends StatefulWidget {
  static String id = 'Cart_Screen';
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Future<Null> refresh() async {
    await Future.delayed(
      Duration(seconds: 2),
    );
    setState(() {});
    return null;
  }

  Future getBusDetails(String busName) async {
    try {
      var querySnapshot = await _firestore
          .collection('buses')
          .where('busname', isEqualTo: busName)
          .getDocuments();
      final List<DocumentSnapshot> documents = querySnapshot.documents;

      for (var document in documents) {
        busDetails = document.data;
      }
      return busDetails;
    } catch (e) {
      print(e);
      return e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPageBackgroundColor,
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        centerTitle: true,
        title: Text(
          'CART',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              color: kAppBarColor,
            ),
            StreamBuilder(
              stream: _firestore.collection('buses').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
                  );
                }
                final busesList = snapshot.data.documents;
                List<Widget> buses = [];
                for (var bus in busesList) {
                  final busName = bus.data['busname'];
                  final date = bus.data['date'];
                  final distance = bus.data['distance'];
                  final fare = bus.data['fare'];
                  final type = bus.data['type'];
                  final status = bus.data['status'];

                  final busCard = BusCard4(
                    busName: busName,
                    busType: type,
                    distance: distance,
                    date: date,
                    fare: fare.toString(),
                    status: status,
                    color: Colors.red,
                    onPress: () async {
                      busData = await getBusDetails(busName);
                      Navigator.pushNamed(context, BusDetails.id);
                    },
                  );

                  buses.add(busCard);
                }

                return RefreshIndicator(
                  onRefresh: refresh,
                  child: ListView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                    children: buses,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
