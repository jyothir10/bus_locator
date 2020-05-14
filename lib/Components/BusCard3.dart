import 'package:bus_locator/screens/orderScreen.dart';
import 'package:flutter/material.dart';
import 'package:bus_locator/Components/reusableCard.dart';

class BusCard3 extends StatelessWidget {
  final String busName;
  final String distance;
  final double fare;
  final String busType;
  final Color color;

  BusCard3({
    this.busName,
    this.distance,
    this.busType,
    this.fare,
    this.color,
  });
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
                      ],
                    ),
                  ],
                ),
              ),
              colour: Color(0xFF28284D),
              onPress: () {
                //TODO:route.
                Navigator.pushReplacementNamed(context, OrderScreen.id);
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: ReusableCard(
              cardChild: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 74,
                  child: Center(
                    child: Text(
                      fare.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ),
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
