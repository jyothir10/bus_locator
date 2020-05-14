import 'package:bus_locator/Components/Constants.dart';
import 'package:flutter/material.dart';
import 'package:bus_locator/Components/BusCard4.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bus_locator/Components/RoundedButton.dart';

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
              Padding(
                padding: const EdgeInsets.only(top: 5, right: 30, left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "distance : $dist",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      distance,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Icon(
                            FontAwesomeIcons.home,
                            color: Colors.deepPurpleAccent,
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Port(
                              portNo: 1,
                              address: '1',
                              color: Colors.white,
                              time: '10:00 AM',
                            ),
                            Port(
                                portNo: 2,
                                address: '2',
                                color: Colors.redAccent,
                                time: '10:06 AM'),
                            Port(
                                portNo: 3,
                                address: '3',
                                color: Colors.greenAccent,
                                time: '10:11 AM'),
                            Port(
                                portNo: 3,
                                address: '4',
                                color: Colors.greenAccent,
                                time: '10:15 AM'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              RoundedButton(
                  color: kButtonActiveColor,
                  textColor: Colors.white,
                  text: 'Order',
                  onPress: () {
                    //TODO: place order
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class Port extends StatelessWidget {
  final int portNo;
  final Color color;
  final String address;
  final String time;

  Port(
      {@required this.portNo,
      @required this.address,
      @required this.color,
      @required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Icon(
            FontAwesomeIcons.solidCircle,
            color: color,
            size: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Text(
                  'Port $portNo',
                  style: TextStyle(
                      color: color, fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  '  Address line $address',
                  style: TextStyle(
                    color: color,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 10, top: 8, bottom: 8),
            child: Text(
              time,
              style: TextStyle(color: color),
            ),
          ),
        ],
      ),
    );
  }
}
