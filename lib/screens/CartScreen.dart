import 'package:flutter/material.dart';
import 'package:bus_locator/Components/Constants.dart';
import 'package:bus_locator/Components/BusCard4.dart';
import 'package:bus_locator/Components/BottomBar.dart';

class CartScreen extends StatefulWidget {
  static String id = 'Cart_Screen';
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    List<Widget> buses = [
      BusCard4(
        busName: 'Bus A01',
        fare: 9.81,
        busType: 'Non AC/Hino AKJ1',
        distance: '15min Away',
        color: Colors.red,
        status: 'Cancelled',
        date: '1 May 2020',
      ),
      BusCard4(
        busName: 'Bus A01',
        fare: 9.81,
        busType: 'Non AC/Hino AKJ1',
        distance: '15min Away',
        color: Colors.red,
        status: 'Done',
        date: '1 May 2020',
      ),
      BusCard4(
        busName: 'Bus A01',
        fare: 9.81,
        busType: 'Non AC/Hino AKJ1',
        distance: '15min Away',
        color: Colors.red,
        status: 'Done',
        date: '1 May 2020',
      ),
      BusCard4(
        busName: 'Bus A01',
        fare: 9.81,
        busType: 'Non AC/Hino AKJ1',
        distance: '15min Away',
        color: Colors.red,
        status: 'Done',
        date: '1 May 2020',
      ),
    ];
    return Scaffold(
      bottomNavigationBar: BottomBar(),
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        leading: IconButton(
          icon: Container(
            child: Icon(
              Icons.keyboard_backspace,
              color: Colors.white,
              size: 30,
            ),
          ),
          onPressed: null,
        ),
        titleSpacing: 120,
        title: Text(
          'CART',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: kAppBarColor,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: buses,
            ),
          ),
        ],
      ),
    );
  }
}
