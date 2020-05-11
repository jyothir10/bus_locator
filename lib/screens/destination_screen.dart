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
    List<Widget> buses = [
      BusCard(
        busName: 'Bus A01',
        fare: 9.81,
      ),
      BusCard(
        busName: 'Bus A01',
        fare: 9.81,
      ),
      BusCard(
        busName: 'Bus A01',
        fare: 9.81,
      ),
      BusCard(
        busName: 'Bus A01',
        fare: 9.81,
      ),
    ];

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
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: buses,
          ),
        ),
      ),
    );
  }
}

class BusCard extends StatelessWidget {
  final String busName;
  final String distance;
  final double fare;
  final String busType;

  BusCard({this.busName, this.distance, this.busType, this.fare});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: ReusableCard(
              cardChild: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  busName,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              colour: Color(0xFF28284D),
              onPress: () {},
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardChild: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  fare.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              colour: Color(0xFF242448),
              onPress: () {},
            ),
          ),
        ],
      ),
    );
  }
}
