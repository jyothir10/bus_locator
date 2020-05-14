import 'package:flutter/material.dart';
import 'package:bus_locator/Components/Constants.dart';

class Profile extends StatefulWidget {
  static String id = 'profile_Screen';
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'My Profile',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 30.0,
              child: Icon(
                Icons.picture_in_picture,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Color(0xFF28284D),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Name',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Vivek SJ',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
