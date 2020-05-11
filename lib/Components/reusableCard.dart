import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({this.colour, this.cardChild, this.onPress});

  final Color colour;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5, right: 0),
          child: Center(child: cardChild),
        ),
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: colour,

        ),
      ),
    );
  }
}
