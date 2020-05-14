import 'package:flutter/material.dart';
import 'package:bus_locator/Components/Constants.dart';
import 'package:bus_locator/Components/BusCard4.dart';
import 'package:bus_locator/Components/BottomBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = Firestore.instance;

class CartScreen extends StatefulWidget {
  static String id = 'Cart_Screen';
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
//    List<Widget> buses = [
//      BusCard4(
//        busName: 'Bus A01',
//        fare: 9.81,
//        busType: 'Non AC/Hino AKJ1',
//        distance: '15min Away',
//        color: Colors.red,
//        status: 'Cancelled',
//        date: '1 May 2020',
//      ),
//      BusCard4(
//        busName: 'Bus A01',
//        fare: 9.81,
//        busType: 'Non AC/Hino AKJ1',
//        distance: '15min Away',
//        color: Colors.red,
//        status: 'Done',
//        date: '1 May 2020',
//      ),
//      BusCard4(
//        busName: 'Bus A01',
//        fare: 9.81,
//        busType: 'Non AC/Hino AKJ1',
//        distance: '15min Away',
//        color: Colors.red,
//        status: 'Done',
//        date: '1 May 2020',
//      ),
//      BusCard4(
//        busName: 'Bus A01',
//        fare: 9.81,
//        busType: 'Non AC/Hino AKJ1',
//        distance: '15min Away',
//        color: Colors.red,
//        status: 'Done',
//        date: '1 May 2020',
//      ),
//    ];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kAppBarColor,
          title: Center(
            child: Text(
              'CART',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Stack(
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
                      backgroundColor: Colors.lightBlueAccent,
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
