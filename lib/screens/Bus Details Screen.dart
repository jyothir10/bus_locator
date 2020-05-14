import 'package:bus_locator/Components/Constants.dart';
import 'package:flutter/material.dart';
import 'package:bus_locator/Components/BusCard4.dart';

class BusDetails extends StatefulWidget {
  static String id = 'BusDetail_Screen';
  @override
  _BusDetailsState createState() => _BusDetailsState();
}

class _BusDetailsState extends State<BusDetails> {
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
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: kPageBackgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: TextField(
                  controller: _controller,
                  enabled: true,
                  decoration: InputDecoration(focusColor: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
