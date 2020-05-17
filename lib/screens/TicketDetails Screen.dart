import 'package:bus_locator/Authentication/bloc/auth_bloc1.dart';
import 'package:bus_locator/Authentication/bloc/auth_event.dart';
import 'package:bus_locator/Authentication/bloc/auth_state.dart';
import 'package:bus_locator/Authentication/ui/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:bus_locator/Components/Constants.dart';
import 'package:bus_locator/Authentication/ui/additionals.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TicketDetails extends StatefulWidget {
  static String id = 'Ticket_Details_Screen';
  @override
  _TicketDetailsState createState() => _TicketDetailsState();
}

class _TicketDetailsState extends State<TicketDetails> {
  var ticketNo;
  List<DropdownMenuItem> noOfTickets = [
    DropdownMenuItem(
      child: Text('1'),
    ),
    DropdownMenuItem(
      child: Text('2'),
    ),
    DropdownMenuItem(
      child: Text('3'),
    ),
    DropdownMenuItem(
      child: Text('4'),
    ),
    DropdownMenuItem(
      child: Text('5'),
    ),
    DropdownMenuItem(
      child: Text('6'),
    ),
    DropdownMenuItem(
      child: Text('7'),
    ),
    DropdownMenuItem(
      child: Text('8'),
    ),
    DropdownMenuItem(
      child: Text('9'),
    ),
    DropdownMenuItem(
      child: Text('10'),
    ),
  ];

  final name = InputCard("Name", 0, true);
  final age = InputCard("Age", 0, true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.keyboard_backspace,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: kPageBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "Ticket Details",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    createLabel("Name", 0),
                    name,
                    createLabel("Age", 0),
                    age,
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(
                    "No of tickets",
                    style: TextStyle(
                        color: HexColor("#ae67d6"),
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                Card(
                  margin: EdgeInsets.fromLTRB(0, 5, 10, 5),
                  color: HexColor("#38385c"),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    child: DropdownButton(
                      underline: SizedBox(),
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                      icon: Icon(Icons.arrow_drop_down),
                      iconEnabledColor: Colors.grey[900],
                      items: noOfTickets,
                      value: ticketNo,
                      hint: Text(
                        "No : of tickets",
                        style: TextStyle(color: Colors.grey),
                      ),
                      onChanged: (value) {
                        ticketNo = value;
                        //TODO : calculate total price
                      },
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Divider(
                    thickness: 2,
                    color: Color(0xFF28284D),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Total Price',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        '10.00',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
                      child: FlatButton(
                        child: Text("Next"),
                        color: HexColor("#693abd"),
                        textColor: Colors.white,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.black,
                        padding: EdgeInsets.all(2.0),
                        splashColor: Colors.blueAccent,
                        onPressed: () {
                          //TODO : goto next payment page
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//DropdownButton(
//elevation: 5,
//items: noOfTickets,
//hint: Text(
//"No : of tickets",
//style: TextStyle(color: Colors.white),
//),
//),
