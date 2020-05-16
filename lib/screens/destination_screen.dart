import 'package:bus_locator/Components/Constants.dart';
import 'package:bus_locator/Components/TabBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bus_locator/Components/BusCard3.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'orderScreen.dart';

final _firestore = Firestore.instance;
String selectedBus;

class Destination extends StatefulWidget {
  static String id = 'Destination_Screen';
  @override
  _DestinationState createState() => _DestinationState();
}

class _DestinationState extends State<Destination> {
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
    String hintText1 = 'From';
    String hintText2 = "To";

    List<Widget> buses = [
      Container(
        color: kBottomBarColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 7),
                        child: Icon(
                          FontAwesomeIcons.dotCircle,
                          size: 20,
                          color: Colors.white30,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: TextField(
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF28284D),
                                ),
                              ),
                              hintText: hintText1,
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                            controller: _controller,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                            onChanged: (value) {
                              //TODO:Starting point selection
                            },
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
                      Padding(
                        padding: const EdgeInsets.only(right: 7),
                        child: Icon(
                          Icons.location_on,
                          color: Colors.red,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 11),
                          child: TextField(
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF28284D),
                                ),
                              ),
                              hintText: hintText2,
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                            controller: _controller,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                            onChanged: (value) {
                              hintText2 = value;
                              //TODO:Destination point selection
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 15, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, TabBarClass.id);
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(0.8),
                          radius: 25,
                          child: Icon(
                            Icons.compare_arrows,
                            color: kPageBackgroundColor,
                            size: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
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
            child: StreamBuilder(
                stream: _firestore.collection('bus').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      ),
                    );
                  }

                  final busesList = snapshot.data.documents;
                  for (var bus in busesList) {
                    final busName = bus.data['busname'];
                    final type = bus.data['bustype'];
                    final distance = bus.data['distance'];
                    final fare = bus.data['fare'];

                    final busCard = BusCard3(
                      busName: busName,
                      busType: type,
                      distance: distance,
                      fare: fare.toString(),
                      color: Colors.red,
                      onPress: () {
                        //TODO:route.
                        Navigator.pushNamed(context, OrderScreen.id);
                        print(busName);
                        selectedBus=busName;
                      },
                    );
                    buses.add(busCard);
                  }

                  return ListView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                    children: buses,
                  );
                }),
          ),
        ],
      ),
    );
  }
}
