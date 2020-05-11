import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bus_locator/Components/reusableCard.dart';

class Destination extends StatefulWidget {
  static String id = 'Destination_Screen';
  @override
  _DestinationState createState() => _DestinationState();
}

class _DestinationState extends State<Destination> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1B1B3B),
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_backspace,
            color: Colors.white,
            size: 30,
          ),
          onPressed: null,
        ),
        titleSpacing: 80,
        title: Text(
          'DESTINATION',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          ReusableCard(
            busname: 'Bus A01',
            fare: 9.81,
          ),
          ReusableCard(
            busname: 'Bus A01',
            fare: 9.81,
          ),
          ReusableCard(
            busname: 'Bus A01',
            fare: 9.81,
          ),
          ReusableCard(
            busname: 'Bus A01',
            fare: 9.81,
          ),
        ],
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  String busname;
  String distance;
  double fare;
  String bustype;

  ReusableCard({this.busname, this.distance, this.bustype, this.fare});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        reusableCard(
          cardChild: Text(
            busname,
            style: TextStyle(color: Colors.white),
          ),
          colour: Color(0xFF28284D),
          onPress: (){},
        ),
        reusableCard(
          cardChild: Text(
            fare.toString(),
            style: TextStyle(color: Colors.white),
          ),
          colour: Color(0xFF242448),
          onPress: (){},
        ),
      ],
    );
  }
}


