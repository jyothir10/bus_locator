import 'package:bus_locator/Components/Constants.dart';
import 'package:bus_locator/Components/TabBar.dart';
import 'package:flutter/material.dart';
import 'additionals.dart';

void main() => runApp(
      MaterialApp(
        home: SafeArea(
          child: Scaffold(
            backgroundColor: HexColor("#1b1c3b"),
            body: RecieptScreen(),
          ),
        ),
      ),
    );

class RecieptScreen extends StatefulWidget {
  static String id = 'Reciept_Screen';
  @override
  _RecieptScreenState createState() => _RecieptScreenState();
}

class _RecieptScreenState extends State<RecieptScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPageBackgroundColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: HexColor("#13132d"),
          ),
          margin: EdgeInsets.fromLTRB(20, 50, 20, 10),
          height: 450,
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [HexColor("#ed4443"), HexColor("#C13094")]),
                ),
                margin: EdgeInsets.fromLTRB(30, 50, 30, 10),
                width: 400,
                height: 200,
                child: Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Positioned(
                      right: -65,
                      top: -65,
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, TabBarClass.id);
                        },
                        color: HexColor("#ae67d6"),
                        textColor: Colors.white,
                        child: Icon(
                          Icons.close,
                          size: 20,
                        ),
                        shape: CircleBorder(),
                      ),
                    ),
                    Positioned(
                      left: 30,
                      top: 25,
                      child: Text(
                        "CREDIT CARD",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                        left: 30,
                        top: 50,
                        child: Text(
                          "4455 6675 3345 2234",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        )),
                    Positioned(
                      right: -35,
                      top: 170,
                      child: MaterialButton(
                        onPressed: () {},
                        color: HexColor("#9aee21"),
                        textColor: Colors.white,
                        child: Icon(
                          Icons.check,
                          size: 20,
                        ),
                        shape: CircleBorder(),
                      ),
                    ),
                    Positioned(
                      left: 30,
                      bottom: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "CARD HOLDER",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text("John Doe",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20))
                            ],
                          ),
                          SizedBox(
                            width: 75,
                          ),
                          Column(children: <Widget>[
                            Text("EXP. DATE",
                                style: TextStyle(color: Colors.white)),
                            Text("09/20",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20))
                          ]),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Payment Successful !",
                  style: TextStyle(
                      color: HexColor("#693ebd"),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "Your Payment was successfull.",
                style: TextStyle(color: Colors.white),
              ),
              Text(" The changes will be processed soon.",
                  style: TextStyle(color: Colors.white))
            ],
          ),
        ),
      ),
    );
  }
}
