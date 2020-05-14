import 'package:bus_locator/Components/Constants.dart';
import 'package:flutter/material.dart';
import 'package:bus_locator/Components/BusCard4.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BusDetails extends StatefulWidget {
  static String id = 'BusDetail_Screen';
  @override
  _BusDetailsState createState() => _BusDetailsState();
}

class _BusDetailsState extends State<BusDetails> {
  TextEditingController _controller;

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String busName = 'Bus A01';
    String date = '1 May 2020';
    String distance = '15min Away';
    String dist = '7.4 Miles';

    return SafeArea(
      child: Scaffold(
        body: Container(
          color: kPageBackgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.keyboard_backspace,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            busName,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text(
                            date,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              BusCard4(
                busName: 'Bus A01',
                fare: '9.81',
                busType: 'Non AC/Hino AKJ1',
                distance: '15min Away',
                color: Colors.redAccent,
                date: '1 May 2020',
                status: 'cancelled',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: Text(
                      "distance : $dist",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: Text(
                      distance,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(),
                  readOnly: true,
                  maxLines: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(FontAwesomeIcons.home),
                        Row(
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.solidCircle,
                              color: Colors.white,
                              size: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'Port 1st',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    '  Address line 1st',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '10:08 AM',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//TextField(
//controller: _controller,
//enabled: true,
//decoration: InputDecoration(focusColor: Colors.white),
//),
