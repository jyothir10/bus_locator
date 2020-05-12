import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color color;
  final String text;
  final Function onPress;
  final Color textcolor;

  RoundedButton(
      {@required this.color, @required this.text, @required this.onPress,this.textcolor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(5.0),
        child: MaterialButton(
          onPressed: onPress,
          minWidth: 370,
          height: 50.0,
          child: Text(
            text,
            style: TextStyle(color: textcolor),
          ),
        ),
      ),
    );
  }
}
