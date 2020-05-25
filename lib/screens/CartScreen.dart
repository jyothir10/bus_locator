import 'package:flutter/material.dart';
import 'package:bus_locator/Components/Constants.dart';
import 'package:bus_locator/Components/BusCard4.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'BusDetailsScreen.dart';
import 'destination_screen.dart';

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
  final _auth = FirebaseAuth.instance;
  Future<Null> refresh() async {
    await Future.delayed(
      Duration(seconds: 2),
    );
    setState(() {});
    return null;
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        id = loggedInUser.uid;
      }
    } catch (e) {
      print(e);
    }
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

  deleteData(String docId) async {
    print(docId);
    try {
      await _firestore.collection('ticketdetails').document(docId).delete();
    } catch (e) {
      print(e);
    }
  }

  createDialogue(BuildContext context, String docId) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            elevation: 16,
            child: Container(
              decoration: BoxDecoration(
                color: kPageBackgroundColor,
                borderRadius: BorderRadius.circular(15.0),
              ),
              padding: EdgeInsets.all(10.0),
              height: 250,
              width: 360,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Are you sure you want to delete ?',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 19),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FlatButton(
                        color: Colors.redAccent,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Delete",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ),
                        onPressed: () async {
                          await deleteData(docId);
                          Navigator.pop(context);
                        },
                      ),
                      FlatButton(
                        color: kBottomBarActiveIconColor,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
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
              stream: _firestore
                  .collection('buses')
                  .where('id', isEqualTo: id)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
                  );
                }
                final busesList = snapshot.data.documents.reversed;
                List<Widget> buses = [];
                for (var bus in busesList) {
                  final busName = bus.data['busname'];
                  final date = bus.data['date'];
                  final distance = bus.data['distance'];
                  final fare = bus.data['fare'];
                  final type = bus.data['type'];
                  final status = bus.data['status'];
                  final docId = bus.data['docId'];

                  final busCard = BusCard4(
                      busName: busName,
                      busType: type,
                      distance: distance,
                      date: date,
                      fare: fare.toString(),
                      status: status,
                      color: Colors.red,
                      onPress: () async {
                        print(busName);
                        busData = await getBusDetails(busName);
                        Navigator.pushNamed(context, BusDetails.id);
                      },
                      onLongPress: () {
                        createDialogue(context, docId);
                      });

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
