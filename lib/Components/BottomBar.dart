import 'package:bus_locator/homePage.dart';
import 'package:bus_locator/screens/CartScreen.dart';
import 'package:bus_locator/screens/cart_profile.dart';
import 'package:bus_locator/screens/destination_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bus_locator/Components/Constants.dart';

int currentIndex = 0;

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedFontSize: kBottomBarFontSize,
      unselectedFontSize: kBottomBarFontSize,
      selectedItemColor: kBottomBarActiveIconColor,
      unselectedItemColor: kBottomBarInactiveIconColor,
      showSelectedLabels: false,
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 27,
          ),
          title: Text('home'),
          backgroundColor: kBottomBarColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.bus,
            size: 22,
          ),
          title: Text('bus'),
          backgroundColor: kBottomBarColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_shopping_cart, size: 27),
          title: Text('cart'),
          backgroundColor: kBottomBarColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.user, size: 22),
          title: Text(
            'account',
          ),
          backgroundColor: kBottomBarColor,
        ),
      ],
      onTap: (index) {
        setState(() {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, HomePage.id);
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, Destination.id);
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, CartScreen.id);
          } else {
            Navigator.pushReplacementNamed(context, CartProfile.id);
          }
          currentIndex = index;
        });
      },
    );
  }
}
