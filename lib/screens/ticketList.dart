import 'package:flutter/material.dart';
import 'package:bus_locator/Components/Constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bus_locator/Components/BusCard3.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'ticket.dart';

final _firestore = Firestore.instance;
final _auth = FirebaseAuth.instance;
var ticketDetails;

FirebaseUser loggedInUser;
var id;
var ticketData;

class TicketList extends StatefulWidget {
  static String id = 'ticket_list';
  @override
  _TicketListState createState() => _TicketListState();
}

class _TicketListState extends State<TicketList> {
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

  @override
  void initState() {
    getCurrentUser();
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPageBackgroundColor,
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: Center(
          child: Text(
            'TICKET LIST',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
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

                final ticketList = snapshot.data.documents;
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
                      Navigator.pushNamed(context, TicketScreen.id);
                    },
                  );

                  buses.add(busCard);
                }

                return ListView(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                  children: buses,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
