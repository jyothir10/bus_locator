import 'package:bus_locator/Components/Constants.dart';
import 'package:flutter/material.dart';
import 'reusableCard.dart';

class BusCard extends StatelessWidget {
  final String busName;
  final String distance;
  final double fare;
  final String busType;
  final Color color;
  final String status;
  final String date;
  BusCard(
      {this.busName,
      this.distance,
      this.busType,
      this.fare,
      this.status,
      this.color,
      this.date});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 5,
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
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          date,
                          style: TextStyle(
                              color: kBottomBarInactiveIconColor,
                              fontWeight: FontWeight.bold),
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
            flex: 2,
            child: ReusableCard(
              cardChild: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      fare.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      status,
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 13.5),
                    ),
                  ],
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
