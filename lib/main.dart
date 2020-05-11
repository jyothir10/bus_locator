import 'package:bus_locator/screens/destination_screen.dart';
import 'package:bus_locator/screens/homePage.dart';
import 'package:flutter/material.dart';
import 'Authentication/ui/login_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      routes: {
        HomePage.id: (context) => HomePage(),
        LoginPage.id: (context) => LoginPage(),
        Destination.id: (context) => Destination(),
      },
      debugShowCheckedModeBanner: false,
      title: 'TheGorgeousLogin',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
