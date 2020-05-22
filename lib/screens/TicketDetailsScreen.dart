import 'package:bus_locator/Payment/screens/paymentscreen.dart';
import 'package:bus_locator/screens/PaymentConformationScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bus_locator/Components/Constants.dart';
import 'package:bus_locator/Authentication/ui/additionals.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'orderScreen.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;
double amount = 9.81;
double totalAmount = amount;
int passengerNo;

class TicketDetails extends StatefulWidget {
  static String id = 'Ticket_Details_Screen';
  @override
  _TicketDetailsState createState() => _TicketDetailsState();
}

class _TicketDetailsState extends State<TicketDetails> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  String ticketNo;
  String name;
  String age;
  String from;
  String to;
  String day;
  String month;
  String year;
  var id;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        id = loggedInUser.uid;
      }
    } catch (e) {
      print(e);
    }
  }

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
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: SafeArea(
            child: Container(
              color: kPageBackgroundColor,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "Ticket Details",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                            padding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 10),
                            child: DropdownButton<String>(
                              items: <String>[
                                '1',
                                '2',
                                '3',
                                '4',
                                '5',
                                '6',
                                '7',
                                '8',
                                '9',
                                '10'
                              ].map((String value) {
                                return DropdownMenuItem<String>(
                                    value: value, child: Text(value));
                              }).toList(),
                              underline: SizedBox(),
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                              icon: Icon(Icons.arrow_drop_down),
                              iconEnabledColor: Colors.grey[900],
                              value: ticketNo,
                              hint: Text(
                                "No : of tickets",
                                style: TextStyle(color: Colors.grey),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  ticketNo = value;
                                  passengerNo = int.parse(ticketNo);
                                  totalAmount = amount * passengerNo;
                                });
                              },
                            ),
                          ),
                        ),
                        createLabel("Name", 0),
                        InputField(
                          hintText: "Name",
                          obscureText: false,
                          horizontal: 0,
                          onChanged: (value) {
                            name = value;
                          },
                        ),
                        createLabel("Age", 0),
                        InputField(
                          hintText: "Age",
                          obscureText: false,
                          horizontal: 0,
                          onChanged: (value) {
                            age = value;
                          },
                        ),
                        createLabel("From", 0),
                        InputField(
                          hintText: "Starting point",
                          obscureText: false,
                          horizontal: 0,
                          onChanged: (value) {
                            from = value;
                          },
                        ),
                        createLabel("To", 0),
                        InputField(
                          hintText: "Ending point",
                          obscureText: false,
                          horizontal: 0,
                          onChanged: (value) {
                            to = value;
                          },
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(
                        "Select date",
                        style: TextStyle(
                            color: HexColor("#ae67d6"),
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    FlatButton(
                      color: Color(0xFF37385B),
                      textColor: Colors.white54,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(2.0),
                      splashColor: Colors.blueAccent,
                      onPressed: () {
                        DatePicker.showDatePicker(context,
                            showTitleActions: true,
                            minTime: DateTime(2020, 5, 19),
                            maxTime: DateTime(2030, 12, 31), onChanged: (date) {
                          print('change $date');
                        }, onConfirm: (date) {
                          day = (date.day).toString();
                          month = (date.month).toString();
                          year = (date.year).toString();
                        }, currentTime: DateTime.now(), locale: LocaleType.en);
                      },
                      child: Text('select'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Divider(
                        thickness: 2,
                        color: Color(0xFF28284D),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
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
                            totalAmount.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12)),
                        child: FlatButton(
                          child: Text("Make payment"),
                          color: HexColor("#693abd"),
                          textColor: Colors.white,
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.black,
                          padding: EdgeInsets.all(2.0),
                          splashColor: Colors.blueAccent,
                          onPressed: () {
                            setState(() {
                              try {
                                DocumentReference documentReference = _firestore
                                    .collection('ticketdetails')
                                    .document();
                                _firestore.collection('ticketdetails').add({
                                  'name': name,
                                  'age': age,
                                  'passengerno': ticketNo,
                                  'id': id,
                                  'from': from,
                                  'to': to,
                                  'busname': busName,
                                  'fare': fare,
                                  'distance': distance,
                                  'type': busType,
                                  'docId': documentReference.documentID,
                                  'day': day,
                                  'month': month,
                                  'year': year,
                                });
                              } catch (e) {
                                print(e);
                              }
                            });
                            Navigator.pushNamed(
                                context, PaymentConformation.id);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
