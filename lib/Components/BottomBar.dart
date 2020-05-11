import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bus_locator/Constants.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
   
      selectedFontSize: kBottomBarFontSize,
      unselectedFontSize: kBottomBarFontSize,
      selectedItemColor: kBottomBarActiveIconColor,
      unselectedItemColor: kBottomBarInactiveIconColor,
      showSelectedLabels: false,
      currentIndex: _currentIndex,
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
          icon: Icon(FontAwesomeIcons.shoppingCart, size: 22),
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
          _currentIndex = index;
        });
      },
    );
  }
}
