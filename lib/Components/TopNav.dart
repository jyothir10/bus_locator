import 'package:bus_locator/screens/destination_screen.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Constants.dart';
import 'TabBar.dart';

class TopNav extends StatelessWidget {
  final String hintText1;
  final String hintText2 = "To";
  final Function onPressed;
  final TextEditingController controller2;
  final Icon icon;
  TopNav({this.onPressed, this.controller2, this.icon, this.hintText1});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Container(
        color: kBottomBarColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 7),
                        child: Icon(
                          FontAwesomeIcons.dotCircle,
                          size: 20,
                          color: Colors.white30,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: TextField(
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF28284D),
                                ),
                              ),
                              hintText: hintText1,
                              hintStyle:
                                  TextStyle(color: Colors.white, fontSize: 18),
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
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: DotsIndicator(
                    dotsCount: 4,
                    axis: Axis.vertical,
                    decorator: DotsDecorator(
                      size: Size(2, 2),
                      color: Colors.white30,
                      activeColor: Colors.white30,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 7),
                        child: Icon(
                          Icons.location_on,
                          color: Colors.red,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 11),
                          child: TextField(
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF28284D),
                                ),
                              ),
                              hintText: hintText2,
                              hintStyle:
                                  TextStyle(color: Colors.white, fontSize: 18),
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
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 15, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        onTap: onPressed,
                        child: CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(0.8),
                          radius: 25,
                          child: icon,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
