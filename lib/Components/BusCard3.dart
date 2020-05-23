import 'package:bus_locator/screens/orderScreen.dart';
import 'package:flutter/material.dart';
import 'package:bus_locator/Components/reusableCard.dart';

class BusCard3 extends StatelessWidget {
  final String busName;
  final String distance;
  final String fare;
  final String busType;
  final Color color;
  final Function onPress;
  final Function onLongPress;

  BusCard3(
      {this.busName,
      this.distance,
      this.busType,
      this.fare,
      this.color,
      this.onPress,
      this.onLongPress});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: ReusableCard(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0)),
              cardChild: Row(
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          busName,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          busType,
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 7),
                        child: Text(
                          distance,
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              colour: Color(0xFF28284D),
              onPress: onPress,
              onLongPress: onLongPress,
            ),
          ),
          Expanded(
            flex: 1,
            child: ReusableCard(
              cardChild: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 47,
                  child: Center(
                    child: Text(
                      fare.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
                  ),
                ),
              ),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
              ),
              colour: Color(0xFF242448),
            ),
          ),
        ],
      ),
    );
  }
}
