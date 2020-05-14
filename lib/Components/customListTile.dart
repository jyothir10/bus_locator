import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final IconData leading;
  final String name;
  final Function onpress;
  CustomListTile({this.icon, this.leading, this.name, this.onpress});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 0, 8.0, 0),
      child: InkWell(
        splashColor: Color(0xfffff5ee),
        onTap: onpress,
        child: Container(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(leading),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 8.0, 12.0, 8.0),
                    child: Text(
                      name,
                      style: TextStyle(
                          fontSize: 17.0, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              Icon(icon),
            ],
          ),
        ),
      ),
    );
  }
}
