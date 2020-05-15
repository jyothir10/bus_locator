import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

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
  @override
  _TicketScreenState createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TheTicketClipper(),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          margin: EdgeInsets.fromLTRB(30, 30, 30, 50),
          height: double.maxFinite,
          width: double.maxFinite,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.blue[800],
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
                        Text("KLM",
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
                        Text("17th Dec 2020",
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
                        Text("KRM",
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
                        Text("17th Dec 2020",
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
                  height: 200,
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
                          Text("Ricard Marx",
                              style: TextStyle(
                                  color: Colors.blue[900],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                          Divider(
                            thickness: 1,
                            height: 1,
                            color: Colors.grey,
                          ),
                          Text("Age",
                              style: TextStyle(color: Colors.purple[300])),
                          Text("22",
                              style: TextStyle(
                                  color: Colors.blue[900],
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
                            "Seat No",
                            style: TextStyle(color: Colors.purple[300]),
                          ),
                          Text("4A",
                              style: TextStyle(
                                  color: Colors.blue[900],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                          Divider(
                            thickness: 1,
                            height: 1,
                            color: Colors.grey,
                          ),
                          Text("Bus Name",
                              style: TextStyle(color: Colors.purple[300])),
                          Text("express",
                              style: TextStyle(
                                  color: Colors.blue[900],
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
                  data: "itsmenevin",
                  version: QrVersions.auto,
                  size: 100,
                ),
              )
            ],
          )),
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
