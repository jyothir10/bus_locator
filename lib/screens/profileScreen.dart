import 'package:flutter/material.dart';
import 'package:bus_locator/Components/Constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _auth = FirebaseAuth.instance;
FirebaseUser loggedInUser;
var id;

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

class ProfileScreen extends StatefulWidget {
  static String id = 'profile_Screen';
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.keyboard_backspace,
            size: 30,
            color: Colors.white,
          ),
        ),
        backgroundColor: kAppBarColor,
        title: Text(
          'My Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
          child: Column(
            children: <Widget>[
              ProfileDetails(
                field: "Name",
                value: "name",
              ),
              ProfileDetails(
                field: "Email",
                value: loggedInUser.email,
              ),
              ProfileDetails(
                field: "Gender",
                value: "Male",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileDetails extends StatelessWidget {
  final String field;
  final String value;

  ProfileDetails({@required this.value, @required this.field});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              field,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w400),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    value,
                    style: TextStyle(color: Colors.grey, fontSize: 17),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: kBottomBarInactiveIconColor,
                ),
              ],
            ),
          ],
        ),
        Divider(
          color: Colors.blueGrey,
        ),
      ],
    );
  }
}
