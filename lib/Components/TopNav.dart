import 'package:bus_locator/screens/destination_screen.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bus_locator/Payment/screens/additionals.dart';

import 'Constants.dart';
import 'TabBar.dart';

class TopNav extends StatelessWidget {
  final String hintText1;
  final String hintText2 = "Choose Destination";
  final Function onPressed;
  final TextEditingController controller2;
  final Icon icon;
  TopNav({this.onPressed, this.controller2, this.icon, this.hintText1});
  @override
//  Widget build(BuildContext context) {
//    return Padding(
//      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
//      child: Container(
//        color: kBottomBarColor,
//        child: Padding(
//          padding: const EdgeInsets.all(8.0),
//          child: Padding(
//            padding: const EdgeInsets.symmetric(vertical: 8),
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                Padding(
//                  padding: const EdgeInsets.symmetric(horizontal: 8),
//                  child: Row(
//                    children: <Widget>[
//                      Padding(
//                        padding: const EdgeInsets.only(right: 7),
//                        child: Icon(
//                          FontAwesomeIcons.dotCircle,
//                          size: 20,
//                          color: Colors.white30,
//                        ),
//                      ),
//                      Expanded(
//                        child: Padding(
//                          padding: const EdgeInsets.symmetric(horizontal: 12),
//                          child: TextField(
//                            decoration: InputDecoration(
//                              enabledBorder: UnderlineInputBorder(
//                                borderSide: BorderSide(
//                                  color: Color(0xFF28284D),
//                                ),
//                              ),
//                              hintText: hintText1,
//                              hintStyle:
//                                  TextStyle(color: Colors.white, fontSize: 18),
//                            ),
//                            controller: controller2,
//                            style: TextStyle(
//                              color: Colors.white,
//                              fontSize: 15,
//                            ),
//                            onChanged: (value) {
//                              //TODO:Starting point selection
//                            },
//                          ),
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//                Padding(
//                  padding: const EdgeInsets.symmetric(horizontal: 8),
//                  child: DotsIndicator(
//                    dotsCount: 4,
//                    axis: Axis.vertical,
//                    decorator: DotsDecorator(
//                      size: Size(2, 2),
//                      color: Colors.white30,
//                      activeColor: Colors.white30,
//                    ),
//                  ),
//                ),
//                Padding(
//                  padding: const EdgeInsets.symmetric(horizontal: 8),
//                  child: Row(
//                    children: <Widget>[
//                      Padding(
//                        padding: const EdgeInsets.only(right: 7),
//                        child: Icon(
//                          Icons.location_on,
//                          color: Colors.red,
//                        ),
//                      ),
//                      Expanded(
//                        child: Padding(
//                          padding: const EdgeInsets.symmetric(horizontal: 11),
//                          child: TextField(
//                            decoration: InputDecoration(
//                              enabledBorder: UnderlineInputBorder(
//                                borderSide: BorderSide(
//                                  color: Color(0xFF28284D),
//                                ),
//                              ),
//                              hintText: hintText2,
//                              hintStyle:
//                                  TextStyle(color: Colors.white, fontSize: 18),
//                            ),
//                            controller: controller2,
//                            style: TextStyle(
//                              color: Colors.white,
//                              fontSize: 15,
//                            ),
//                            onChanged: (value) {
//                              //TODO:Destination point selection
//                            },
//                          ),
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//                Padding(
//                  padding: const EdgeInsets.fromLTRB(0, 20, 15, 0),
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.end,
//                    children: <Widget>[
//                      GestureDetector(
//                        onTap: onPressed,
//                        child: CircleAvatar(
//                          backgroundColor: Colors.white.withOpacity(0.8),
//                          radius: 25,
//                          child: icon,
//                        ),
//                      ),
//                    ],
//                  ),
//                )
//              ],
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//}
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
            color: HexColor("#13132d"),
            height: 190,
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: Column(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.solidDotCircle,
                            color: Colors.grey,
                          ),
                          Icon(
                            FontAwesomeIcons.ellipsisV,
                            color: Colors.grey[100],
                            size: 20,
                          ),
                          Icon(FontAwesomeIcons.ellipsisV,
                              color: Colors.grey[100], size: 20),
                          Icon(
                            FontAwesomeIcons.mapMarkerAlt,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Container(
                        width: 300,
                        child: Column(
                          children: <Widget>[
                            TextField(
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF28284D),
                                  ),
                                ),
                                hintText: hintText1,
                                hintStyle: TextStyle(
                                    color: Colors.blueGrey, fontSize: 18),
                              ),
                              controller: controller2,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                              onChanged: (value) {
                                //TODO:Starting point selection
                              },
                            ),
                            TextField(
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF28284D),
                                  ),
                                ),
                                hintText: hintText2,
                                hintStyle: TextStyle(
                                    color: Colors.blueGrey, fontSize: 18),
                              ),
                              controller: controller2,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                              onChanged: (value) {
                                //TODO:Destination point selection
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: GestureDetector(
                    onTap: onPressed,
                    child: CircleAvatar(
                      backgroundColor: HexColor("#693ebd"),
                      radius: 25,
                      child: icon,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

//MaterialButton(
//                    onPressed: () {
//                      onPressed;
//                    },
//                    color: Colors.purple,
//                    textColor: Colors.white,
//                    child: Padding(
//                      padding: EdgeInsets.all(10),
//                      child: Icon(
//                        Icons.search,
//                        size: 30,
//                      ),
//                    ),
//                    shape: CircleBorder(),
//                  ),
