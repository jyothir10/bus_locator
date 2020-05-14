import 'package:bus_locator/Components/reusableCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bus_locator/Components/Constants.dart';
import 'package:bus_locator/Components/RoundedButton.dart';

class OrderScreen extends StatefulWidget {
  static String id = 'Order_Screen';
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: Center(
          child: Text(
            'DETAIL ORDER',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Container(
        color: kAppBarColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            BuscardOrderPage(
              busName: 'Bus A01',
              busType: 'Non AC/Hino AKJ1',
              far: '15min Away',
              distance: 'Distance: 7.4 Km',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Price',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                maxLines: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total Price',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '9.81',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                maxLines: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RoundedButton(
                color: kButtonActiveColor,
                text: 'Continue',
                onPress: null,
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuscardOrderPage extends StatelessWidget {
  final String busName;
  final String distance;
  final String busType;
  final String far;

  BuscardOrderPage({this.busName, this.busType, this.distance, this.far});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ReusableCard(
        colour: Color(0xFF242448),
        cardChild: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.red,
              radius: 30.0,
              child: Icon(
                Icons.directions_bus,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      busName,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: Text(
                      busType,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                  Text(
                    far,
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                distance,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
