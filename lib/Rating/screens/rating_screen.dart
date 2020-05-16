import 'package:bus_locator/Components/Constants.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class RateScreen extends StatefulWidget {
  static String id = 'rate_Screen';
  @override
  _RateScreenState createState() => _RateScreenState();
}

class _RateScreenState extends State<RateScreen> {
  String feel = "0";
  double _value = 0.0;
  double lastsection = 0.0;
  String feedbacktxt = "Very Poor";
  Color backgroundclr = kPageBackgroundColor;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundclr,
        body: Stack(
          children: <Widget>[
            Center(
              child: FlareActor(
                'assets/feelings.flr',
                fit: BoxFit.contain,
                alignment: Alignment.center,
                animation: feel,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 60),
                  child: Text(
                    feedbacktxt,
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Slider(
                  min: 0.0,
                  max: 100.0,
                  value: _value,
                  divisions: 100,
                  activeColor: Colors.white,
                  inactiveColor: Colors.black,
                  label: 'Set a value',
                  onChanged: (val) {
                    setState(() {
                      _value = val;
                    });
                    if (_value == 0.0) {
                      if (lastsection > 0.0) {
                        setState(() {
                          feel = "0-";
                        });
                      }
                      setState(() {
                        lastsection = 0.0;
                        backgroundclr = Color(0xff13132d);
                        feedbacktxt = "Very Poor";
                      });
                    } else if (_value > 0.0 && _value < 25.0) {
                      if (lastsection == 0.0) {
                        setState(() {
                          feel = "0+";
                        });
                      } else if (lastsection == 50.0) {
                        setState(() {
                          feel = "25-";
                        });
                      }
                      setState(() {
                        lastsection = 25.0;
                        backgroundclr = Color(0xff13132d);
                        feedbacktxt = "Poor";
                      });
                    } else if (_value >= 25.0 && _value < 50.0) {
                      if (lastsection == 25.0) {
                        setState(() {
                          feel = "25+";
                        });
                      } else if (lastsection == 75.0) {
                        setState(() {
                          feel = "50-";
                        });
                      }
                      setState(() {
                        lastsection = 50.0;
                        backgroundclr = Color(0xff13132d);
                        feedbacktxt = "Below Average";
                      });
                    } else if (_value >= 50.0 && _value < 75.0) {
                      if (lastsection == 50.0) {
                        setState(() {
                          feel = "50+";
                        });
                      } else if (lastsection == 100.0) {
                        setState(() {
                          feel = "75-";
                        });
                      }
                      setState(() {
                        lastsection = 75.0;
                        backgroundclr = Color(0xff23132d);
                        feedbacktxt = "Above Average";
                      });
                    } else if (_value >= 75.0 && _value <= 100.0) {
                      if (lastsection == 75.0) {
                        setState(() {
                          feel = "75+";
                        });
                      }
                      setState(() {
                        lastsection = 100.0;
                        backgroundclr = Color(0xff28131d);
                        feedbacktxt = "Excellent";
                      });
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
