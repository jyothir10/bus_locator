import 'package:flutter/material.dart';
import 'package:bus_locator/Components/Constants.dart';
import 'package:bus_locator/Components/BottomBar.dart';
import 'package:bus_locator/Components/reusableCard.dart';
import 'package:bus_locator/Components/RoundedButton.dart';

class CartProfile extends StatefulWidget {
  static String id = 'cartprofile_Screen';
  @override
  _CartProfileState createState() => _CartProfileState();
}

class _CartProfileState extends State<CartProfile> {
  @override
  Widget build(BuildContext context) {
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
      body: Container(
        color: kPageBackgroundColor,
        child: Column(
          children: <Widget>[
            BusCardProfilePage(
              name: 'John Doe',
              email: 'john@gmail.com',
              place: 'Gotham',
            ),
            SizedBox(
              height: 220,
            ),
            RoundedButton(color: kBottomBarColor, text: 'bow',textcolor: Color(0xFF5052E2), onPress: null),
            RoundedButton(color: Color(0xFF5052E2), text: 'bow',textcolor: Colors.white, onPress: null),
          ],
        ),
      ),
    );
  }
}

class BusCardProfilePage extends StatelessWidget {
  final String name;
  final String email;
  final String place;

  BusCardProfilePage({this.name, this.email, this.place});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 4,
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
                        backgroundColor: Colors.green,
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
                          name,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          email,
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          place,
                          style: TextStyle(
                              color: Colors.greenAccent,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              colour: Color(0xFF28284D),
              onPress: () {},
            ),
          ),
          Expanded(
            flex: 2,
            child: ReusableCard(
              cardChild: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 74,
                  child: Center(
                    child: Text(
                      'Edit Profile',
                      style: TextStyle(
                        color: Colors.red,
                      ),
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
