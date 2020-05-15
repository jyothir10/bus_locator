import 'package:bus_locator/screens/destination_screen.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Constants.dart';

class TopNav extends StatelessWidget {
  const TopNav({
    Key key,
    @required TextEditingController controller2,
  }) : _controller2 = controller2, super(key: key);

  final TextEditingController _controller2;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                        padding:
                        const EdgeInsets.symmetric(horizontal: 15),
                        child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF28284D),
                              ),
                            ),
                            hintText: 'From',
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                          controller: _controller2,
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
                      child: TextField(
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF28284D),
                            ),
                          ),
                          hintText: 'To',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                        controller: _controller2,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                        onChanged: (value) {
                          //TODO:Destination point selection
                        },
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
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, Destination.id);
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.8),
                        radius: 25,
                        child: Icon(
                          Icons.search,
                          color: kPageBackgroundColor,
                          size: 35,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
