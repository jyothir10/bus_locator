import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color color;
  final String text;
  final Function onPress;
  final Color textColor;
  final double textSize;

  RoundedButton(
      {@required this.color,
      @required this.text,
      @required this.onPress,
      this.textColor,
      this.textSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(5.0),
        child: MaterialButton(
          elevation: 8.0,
          onPressed: onPress,
          height: 50.0,
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: textSize),
          ),
        ),
      ),
    );
  }
}
