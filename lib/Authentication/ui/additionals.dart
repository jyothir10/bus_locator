import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

Card createInputCard(String hintText, double horizontal, bool obscureText) {
  return Card(
    margin: EdgeInsets.symmetric(vertical: 5, horizontal: horizontal),
    color: HexColor("#38385c"),
    child: TextFormField(
      obscureText: obscureText,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: "$hintText",
        contentPadding: EdgeInsets.all(15.0),
        border: InputBorder.none,
        filled: true,
      ),
    ),
  );
}

Padding createLabel(String label, double horizontal) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 5, horizontal: horizontal),
    child: Text(
      "$label",
      style: TextStyle(
          color: HexColor("#ae67d6"),
          fontWeight: FontWeight.bold,
          fontSize: 15),
    ),
  );
}

Padding createButton(String label) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
    child: Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: FlatButton(
        color: HexColor("#693abd"),
        textColor: Colors.white,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        padding: EdgeInsets.all(2.0),
        splashColor: Colors.blueAccent,
        onPressed: () {
          //TODO:add onpressed here
        },
        child: Container(
          width: 200,
          child: Center(
            child: Text(
              "$label",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    ),
  );
}
