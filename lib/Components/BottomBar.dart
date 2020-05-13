import 'package:bus_locator/Components/TabBar.dart';
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
      backgroundColor: kBottomBarColor,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: kBottomBarFontSize,
      unselectedFontSize: kBottomBarFontSize,
      selectedItemColor: kBottomBarActiveIconColor,
      unselectedItemColor: kBottomBarInactiveIconColor,
      showSelectedLabels: true,
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 27,
          ),
          title: Text('home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.bus,
            size: 22,
          ),
          title: Text('bus'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_shopping_cart, size: 27),
          title: Text('cart'),
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.user, size: 22),
          title: Text(
            'account',
          ),
        ),
      ],
      onTap: (index) {
        setState(() {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, TabBarClass.id);
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, TabBarClass.id);
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, TabBarClass.id);
          } else {
            Navigator.pushReplacementNamed(context, TabBarClass.id);
          }
          currentIndex = index;
        });
      },
    );
  }
}
