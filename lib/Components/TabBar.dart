import 'package:bus_locator/Components/Constants.dart';
import 'package:flutter/material.dart';
import 'package:bus_locator/homePage.dart' as firstPage;
import 'package:bus_locator/screens/CartScreen.dart' as thirdPage;
import 'package:bus_locator/screens/destination_screen.dart' as secondPage;
import 'package:bus_locator/screens/cart_profile.dart' as fourthPage;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TabBarClass extends StatefulWidget {
  static String id = 'Tab_Bar';
  @override
  _TabBarClassState createState() => _TabBarClassState();
}

class _TabBarClassState extends State<TabBarClass>
    with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Material(
        color: kBottomBarColor,
        child: TabBar(
          controller: controller,
          tabs: <Widget>[
            Tab(
              icon: Icon(
                Icons.home,
                size: 27,
              ),
            ),
            Tab(
              icon: Icon(
                FontAwesomeIcons.bus,
                size: 22,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.add_shopping_cart,
                size: 27,
              ),
            ),
            Tab(
              icon: Icon(
                FontAwesomeIcons.user,
                size: 22,
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          firstPage.HomePage(),
          secondPage.Destination(),
          thirdPage.CartScreen(),
          fourthPage.CartProfile(),
        ],
      ),
    );
  }
}
