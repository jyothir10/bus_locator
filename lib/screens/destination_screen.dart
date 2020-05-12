import 'package:bus_locator/Components/Constants.dart';
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
        busType: 'Non AC/Hino AKJ1',
        distance: '15min Away',
        color: Colors.redAccent,
      ),
      BusCard(
        busName: 'Bus A01',
        fare: 9.81,
        busType: 'Non AC/Hino AKJ1',
        distance: '15min Away',
        color: Colors.blueAccent,
      ),
      BusCard(
        busName: 'Bus A01',
        fare: 9.81,
        busType: 'Non AC/Hino AKJ1',
        distance: '15min Away',
        color: Colors.orange,
      ),
      BusCard(
        busName: 'Bus A01',
        fare: 9.81,
        busType: 'Non AC/Hino AKJ1',
        distance: '15min Away',
        color: Colors.green,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        leading: IconButton(
          icon: Container(
            child: Icon(
              Icons.keyboard_backspace,
              color: Colors.white,
              size: 30,
            ),
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
      body: Stack(
        children: <Widget>[
          Container(
            color: kPageBackgroundColor,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: buses,
            ),
          ),
        ],
      ),
    );
  }
}

class BusCard extends StatelessWidget {
  final String busName;
  final String distance;
  final double fare;
  final String busType;
  final Color color;

  BusCard({
    this.busName,
    this.distance,
    this.busType,
    this.fare,
    this.color,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: ReusableCard(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0)),
              cardChild: Padding(
                padding: const EdgeInsets.all(19.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: color,
                        radius: 30.0,
                        child: Icon(
                          Icons.directions_bus,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          busName,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          busType,
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          distance,
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              colour: Color(0xFF28284D),
              onPress: () {},
            ),
          ),
          Expanded(
            flex: 1,
            child: ReusableCard(
              cardChild: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 74,
                  child: Center(
                    child: Text(
                      fare.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ),
                ),
              ),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
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
