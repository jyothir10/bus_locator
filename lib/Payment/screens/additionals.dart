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

Card createInputCard(String hintText) {
  return Card(
    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
    color: HexColor("#38385c"),
    child: TextFormField(
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
      style: TextStyle(color: Colors.white),
    ),
  );
}

Padding createButton(String label) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
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
          /*...*/
        },
        child: Container(width: 200, child: Center(child: Text("$label"))),
      ),
    ),
  );
}
