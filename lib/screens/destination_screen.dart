import 'package:bus_locator/Components/BottomBar.dart';
import 'package:bus_locator/Components/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bus_locator/Components/BusCard3.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.dotCircle,
                      color: Colors.white30,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: DotsIndicator(
                  dotsCount: 4,
                  position: 3,
                  axis: Axis.vertical,
                  decorator: DotsDecorator(
                    size: Size(2, 2),
                    color: Colors.white30,
                    activeColor: Colors.white30,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      color: Colors.red,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.blue[800],
                      radius: 25.0,
                      child: Icon(
                        Icons.compare_arrows,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  )
                ],
              )
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
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: Center(
          child: Text(
            'DESTINATION',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
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
