import 'package:bus_locator/Components/Constants.dart';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'ticketList.dart';

var passengers = ticketData['passengerno'];
var mon;
String date;
String journeyDate;
String createDate(String day, String month, String year) {
  switch (month) {
    case '1':
      mon = 'Jan';
      break;
    case '2':
      mon = 'Feb';
      break;
    case '3':
      mon = 'Mar';
      break;
    case '4':
      mon = 'Apr';
      break;
    case '5':
      mon = 'May';
      break;
    case '6':
      mon = 'Jun';
      break;
    case '7':
      mon = 'Jul';
      break;
    case '8':
      mon = 'Aug';
      break;
    case '9':
      mon = 'Sep';
      break;
    case '10':
      mon = 'Oct';
      break;
    case '11':
      mon = 'Nov';
      break;
    case '12':
      mon = 'Dec';
      break;
  }
  date = '$day $mon $year';
  return date;
}

void main() => runApp(
      MaterialApp(
        home: SafeArea(
            child: Scaffold(
                appBar: AppBar(
                  elevation: 0.0,
                  backgroundColor: Colors.blue[200],
                  leading: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                backgroundColor: Colors.blue[200],
                body: TicketScreen())),
      ),
    );

class TicketScreen extends StatefulWidget {
  static String id = 'Ticket_Screen';

  @override
  _TicketScreenState createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    journeyDate =
        createDate(ticketData['day'], ticketData['month'], ticketData['year']);
    print(journeyDate);
  }

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TheTicketClipper(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                margin: EdgeInsets.fromLTRB(30, 30, 30, 50),
                height: 600,
                width: double.maxFinite,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        color: kPageBackgroundColor,
                      ),
                      height: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                "Boarding from",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(ticketData['from'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                "Kollam Main Bus Stop",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(journeyDate,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                          Column(
//                      crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                "Destination",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(ticketData['to'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                "Karikode Bus Stop No1",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(journeyDate,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold)),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                        height: 150,
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Passenger Name",
                                  style: TextStyle(color: Colors.purple[300]),
                                ),
                                Text(ticketData['name'],
                                    style: TextStyle(
                                        color: Color(0xff13132d),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                                Divider(
                                  thickness: 1,
                                  height: 1,
                                  color: Colors.grey,
                                ),
                                Text("Age",
                                    style:
                                        TextStyle(color: Colors.purple[300])),
                                Text(ticketData['age'],
                                    style: TextStyle(
                                        color: Color(0xff13132d),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                                Divider(
                                  thickness: 1,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "No. of tickets",
                                  style: TextStyle(color: Colors.purple[300]),
                                ),
                                Text("$passengers person",
                                    style: TextStyle(
                                        color: Color(0xff13132d),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                                Divider(
                                  thickness: 1,
                                  height: 1,
                                  color: Colors.grey,
                                ),
                                Text("Bus Name",
                                    style:
                                        TextStyle(color: Colors.purple[300])),
                                Text(ticketData['busname'],
                                    style: TextStyle(
                                        color: Color(0xff13132d),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                                Divider(
                                  thickness: 1,
                                  color: Colors.grey,
                                ),
                              ],
                            )
                          ],
                        )),
                    Container(
                      height: 150,
                      child: QrImage(
                        data: "ticket detail",
                        version: QrVersions.auto,
                        size: 100,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        width: 250,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5)),
                        child: FlatButton(
                          color: kPageBackgroundColor,
                          textColor: Colors.white,
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.black,
                          padding: EdgeInsets.all(2.0),
                          splashColor: Colors.blueAccent,
                          onPressed: () {
                            //TODO:Rate screen. two options show as a dialogue or navigate.
                            //TODO:Backup=>Navigator.pushNamed(context, RateScreen.id);
                            //TODO:required.
                            showDialog(
                              context: context,
                              builder: (context) {
                                String feel = "0";
                                double value = 0.0;
                                double lastsection = 0.0;
                                String feedbacktxt = "Very Poor";
                                Color backgroundclr = Colors.red;
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  elevation: 16,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: kPageBackgroundColor,
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    padding: EdgeInsets.all(10.0),
                                    height: 500,
                                    width: 360,
                                    child: Stack(
                                      children: <Widget>[
                                        Center(
                                          child: FlareActor(
                                            'assets/feelings.flr',
                                            fit: BoxFit.contain,
                                            alignment: Alignment.center,
                                            animation: feel,
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 60),
                                              child: Text(
                                                feedbacktxt,
                                                style: TextStyle(
                                                  fontSize: 36,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Slider(
                                              min: 0.0,
                                              max: 100.0,
                                              value: value,
                                              divisions: 100,
                                              activeColor: Colors.white,
                                              inactiveColor: Colors.black,
                                              label: 'Set a value',
                                              onChanged: (val) {
                                                setState(() {
                                                  value = val;
                                                });
                                                if (value == 0.0) {
                                                  if (lastsection > 0.0) {
                                                    setState(() {
                                                      feel = "0-";
                                                    });
                                                  }
                                                  setState(() {
                                                    lastsection = 0.0;
                                                    backgroundclr = Colors.red;
                                                    feedbacktxt = "Very Poor";
                                                  });
                                                } else if (value > 0.0 &&
                                                    value < 25.0) {
                                                  if (lastsection == 0.0) {
                                                    setState(() {
                                                      feel = "0+";
                                                    });
                                                  } else if (lastsection ==
                                                      50.0) {
                                                    setState(() {
                                                      feel = "25-";
                                                    });
                                                  }
                                                  setState(() {
                                                    lastsection = 25.0;
                                                    backgroundclr =
                                                        Colors.orange;
                                                    feedbacktxt = "Poor";
                                                  });
                                                } else if (value >= 25.0 &&
                                                    value < 50.0) {
                                                  if (lastsection == 25.0) {
                                                    setState(() {
                                                      feel = "25+";
                                                    });
                                                  } else if (lastsection ==
                                                      75.0) {
                                                    setState(() {
                                                      feel = "50-";
                                                    });
                                                  }
                                                  setState(() {
                                                    lastsection = 50.0;
                                                    backgroundclr =
                                                        Colors.orangeAccent;
                                                    feedbacktxt =
                                                        "Below Average";
                                                  });
                                                } else if (value >= 50.0 &&
                                                    value < 75.0) {
                                                  if (lastsection == 50.0) {
                                                    setState(() {
                                                      feel = "50+";
                                                    });
                                                  } else if (lastsection ==
                                                      100.0) {
                                                    setState(() {
                                                      feel = "75-";
                                                    });
                                                  }
                                                  setState(() {
                                                    lastsection = 75.0;
                                                    backgroundclr =
                                                        Colors.yellow;
                                                    feedbacktxt =
                                                        "Above Average";
                                                  });
                                                } else if (value >= 75.0 &&
                                                    value <= 100.0) {
                                                  if (lastsection == 75.0) {
                                                    setState(() {
                                                      feel = "75+";
                                                    });
                                                  }
                                                  setState(() {
                                                    lastsection = 100.0;
                                                    backgroundclr =
                                                        Colors.green;
                                                    feedbacktxt = "Excellent";
                                                  });
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                              width: 200,
                              child: Center(child: Text("Rate your Ride"))),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

class TheTicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(30, 30);
    path.lineTo(30, size.height * 0.6);
    path.quadraticBezierTo(
        65, (size.height * 0.6) + 25, 30, (size.height * 0.6) + 50);
    path.lineTo(30, size.height - 30);
    path.lineTo(size.width - 30, size.height - 30);
    path.lineTo(size.width - 30, (size.height * 0.6) + 50);
    path.quadraticBezierTo(size.width - 65, (size.height * 0.6) + 25,
        size.width - 30, size.height * 0.6);

    path.lineTo(size.width - 30, 30);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
