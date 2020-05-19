import 'package:flutter/material.dart';
import 'package:bus_locator/Components/Constants.dart';

class ticketList extends StatefulWidget {
  static String id = 'ticket_list';
  @override
  _ticketListState createState() => _ticketListState();
}

class _ticketListState extends State<ticketList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPageBackgroundColor,
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: Center(
          child: Text(
            'TICKET LIST',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              color: kAppBarColor,
            ),
          ],
        ),
      ),
    );
  }
}
