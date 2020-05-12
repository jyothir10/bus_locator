import 'package:flutter/material.dart';
import 'package:bus_locator/Components/Constants.dart';

class CartProfile extends StatefulWidget {
  static String id = 'cartprofile_Screen';
  @override
  _CartProfileState createState() => _CartProfileState();
}

class _CartProfileState extends State<CartProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Container(
        color: kPageBackgroundColor,
        child: Column(
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}
