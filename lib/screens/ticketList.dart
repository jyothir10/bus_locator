import 'package:flutter/material.dart';
import 'package:bus_locator/Components/Constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bus_locator/Components/BusCard3.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'ticket.dart';
import 'package:bus_locator/homePage.dart';

final _firestore = Firestore.instance;
final _auth = FirebaseAuth.instance;
var ticketDetails;

var ticketData;

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

class TicketList extends StatefulWidget {
  static String id = 'ticket_list';
  @override
  _TicketListState createState() => _TicketListState();
}

class _TicketListState extends State<TicketList> {
  Future<Null> refresh() async {
    await Future.delayed(
      Duration(seconds: 2),
    );
    setState(() {});
    return null;
  }

  deleteData(String docId) async {
    print(docId);
    try {
      await _firestore.collection('ticketdetails').document(docId).delete();
    } catch (e) {
      print(e);
    }
  }

  Future getTicketDetails(String ticketId) async {
    try {
      var querySnapshot = await _firestore
          .collection('ticketdetails')
          .where('docId', isEqualTo: ticketId)
          .getDocuments();
      final List<DocumentSnapshot> documents = querySnapshot.documents;

      for (var document in documents) {
        ticketDetails = document.data;
      }
      return ticketDetails;
    } catch (e) {
      print(e);
      return e;
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
    getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPageBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kAppBarColor,
        title: Text(
          'TICKET LIST',
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
                  .collection('ticketdetails')
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

                final ticketList = snapshot.data.documents.reversed;
                List<Widget> buses = [];
                for (var bus in ticketList) {
                  final busName = bus.data['busname'];
                  final distance = bus.data['distance'];
                  final fare = bus.data['fare'];
                  final type = bus.data['type'];
                  final noOfTickets = bus.data['passengerno'];
                  final ticketId = bus.data['docId'];

                  final busCard = BusCard3(
                      busName: busName,
                      busType: type,
                      distance: 'No of tickets : $noOfTickets',
                      fare: fare.toString(),
                      color: Colors.red,
                      onPress: () async {
                        print(ticketId);
                        ticketData = await getTicketDetails(ticketId);
                        Navigator.pushReplacementNamed(
                            context, TicketScreen.id);
                      },
                      onLongPress: () {
                        createDialogue(context, ticketId);
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
