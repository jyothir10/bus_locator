import 'package:bus_locator/Authentication/ui/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


class HomePage extends StatelessWidget {
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  void _signOut() async {
    await googleSignIn.signOut();
  }
  

  

  static String id = 'Home_Screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: Center(
          child: GestureDetector(
              onTap: () async {
                _signOut();
                await Navigator.pushReplacementNamed(context, LoginPage.id);
              },
              child: Container(child: Text('Home'))),
        )),
      ),
    );
  }
}
