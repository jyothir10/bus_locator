import 'package:bus_locator/Components/Constants.dart';
import 'package:bus_locator/Payment/screens/Reciept_screen.dart';
import 'package:flutter/material.dart';
import 'additionals.dart';
import 'classes.dart';

void main() => runApp(MaterialApp(
      home: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: HexColor("#13132d"),
          appBar: AppBar(
            elevation: 0.0,
            leading: Icon(Icons.arrow_back),
            backgroundColor: HexColor("#13132d"),
            title: Text("PAYMENT"),
          ),
          body: PaymentScreen(),
        ),
      ),
    ));

class PaymentScreen extends StatefulWidget {
  static const String id = 'Payment_Screen';
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int selectedRadioTile;
  Color selectedcolor;

  @override
  void initState() {
    super.initState();
    selectedRadioTile = 0;
    selectedcolor = Colors.grey;
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
      selectedcolor = Colors.purple;
    });
  }

  Months currentValueSelected;
  Year currentYearValueSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPageBackgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                Divider(
                  thickness: 1.0,
                  color: HexColor("#28284d"),
                ),
                RadioListTile(
                  value: 1,
                  groupValue: selectedRadioTile,
                  title: Text(
                    "Credit Card",
                    style: TextStyle(color: Colors.white),
                  ),
                  onChanged: (val) {
                    setSelectedRadioTile(val);
                  },
                  activeColor: HexColor("#5052e2"),
                  secondary: Text(
                    "VISA",
                    style: TextStyle(color: HexColor("#5052e2")),
                  ),
                  selected: true,
                ),
                Divider(
                  thickness: 1.0,
                  color: HexColor("#28284d"),
                ),
                RadioListTile(
                  value: 2,
                  groupValue: selectedRadioTile,
                  title: Text(
                    "PayPal",
                    style: TextStyle(color: Colors.white),
                  ),
                  onChanged: (val) {
                    setSelectedRadioTile(val);
                  },
                  activeColor: HexColor("#5052e2"),
                  secondary: Text(
                    "VCC",
                    style: TextStyle(color: HexColor("#5052e2")),
                  ),
                  selected: true,
                ),
                Divider(
                  thickness: 1.0,
                  color: HexColor("#28284d"),
                ),
                RadioListTile(
                  value: 1,
                  groupValue: selectedRadioTile,
                  title: Text(
                    "Paytm",
                    style: TextStyle(color: Colors.white),
                  ),
                  onChanged: (val) {
                    setSelectedRadioTile(val);
                  },
                  activeColor: HexColor("#5052e2"),
                  secondary: Text(
                    "UPI",
                    style: TextStyle(color: HexColor("#5052e2")),
                  ),
                  selected: true,
                ),
                Divider(
                  thickness: 1.0,
                  color: HexColor("#28284d"),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  createLabel("CARD NUMBER", 0),
                  createInputCard("Card Number"),
                  createLabel("NAME ON CARD", 0),
                  createInputCard("Name on Card"),
                  Row(
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            createLabel("EXPIRY DATE", 0),
                            Row(
                              children: <Widget>[
                                Card(
                                  margin: EdgeInsets.fromLTRB(0, 5, 10, 5),
                                  color: HexColor("#38385c"),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 10),
                                    child: DropdownButton(
                                      items: buildDropDownMenuMonthItems(),
                                      onChanged: (Months newvalueselected) {
                                        setState(() {
                                          currentValueSelected =
                                              newvalueselected;
                                        });
                                      },
                                      value: currentValueSelected,
                                      underline: SizedBox(),
                                      style: TextStyle(color: Colors.grey),
                                      icon: Icon(Icons.arrow_drop_down),
                                      iconEnabledColor: Colors.grey[900],
                                      hint: Text("MM"),
                                    ),
                                  ),
                                ),
                                Card(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 0),
                                  color: HexColor("#38385c"),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 10),
                                    child: DropdownButton(
                                      items: buildDropDownMenuYearItems(),
                                      onChanged: (Year newYearvalueselected) {
                                        setState(() {
                                          currentYearValueSelected =
                                              newYearvalueselected;
                                        });
                                      },
                                      value: currentYearValueSelected,
                                      underline: SizedBox(),
                                      style: TextStyle(color: Colors.grey),
                                      icon: Icon(Icons.arrow_drop_down),
                                      iconEnabledColor: Colors.grey[900],
                                      hint: Text("YYYY"),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            createLabel("CVV", 0),
                            Card(
                              margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                              color: HexColor("#38385c"),
                              child: TextFormField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: "CVV",
                                  contentPadding: EdgeInsets.all(15.0),
                                  border: InputBorder.none,
                                  filled: true,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            createButton("Buy"),
          ],
        ),
      ),
    );
  }
}
