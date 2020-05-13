import 'package:bus_locator/Components/BottomBar.dart';
import 'package:bus_locator/Components/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bus_locator/Components/BusCard3.dart';

class Destination extends StatefulWidget {
  static String id = 'Destination_Screen';
  @override
  _DestinationState createState() => _DestinationState();
}

class _DestinationState extends State<Destination> {
  @override
  Widget build(BuildContext context) {
    List<Widget> buses = [
      Container(
        color: kBottomBarColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.play_circle_filled,
                    color: Colors.white30,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Gotham',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.location_on,
                    color: Colors.red,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Metropolis',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      BusCard3(
        busName: 'Bus A01',
        fare: 9.81,
        busType: 'Non AC/Hino AKJ1',
        distance: '15min Away',
        color: Colors.redAccent,
      ),
      BusCard3(
        busName: 'Bus A01',
        fare: 9.81,
        busType: 'Non AC/Hino AKJ1',
        distance: '15min Away',
        color: Colors.blueAccent,
      ),
      BusCard3(
        busName: 'Bus A01',
        fare: 9.81,
        busType: 'Non AC/Hino AKJ1',
        distance: '15min Away',
        color: Colors.orange,
      ),
      BusCard3(
        busName: 'Bus A01',
        fare: 9.81,
        busType: 'Non AC/Hino AKJ1',
        distance: '15min Away',
        color: Colors.green,
      ),
    ];

    return Scaffold(
      bottomNavigationBar: BottomBar(),
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
            child: ListView(
              children: buses,
            ),
          ),
        ],
      ),
    );
  }
}
