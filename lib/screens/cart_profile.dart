import 'package:bus_locator/Authentication/bloc/auth_bloc1.dart';
import 'package:bus_locator/Authentication/bloc/auth_event.dart';
import 'package:bus_locator/Authentication/bloc/auth_state.dart';
import 'package:bus_locator/Authentication/ui/additionals.dart';
import 'package:bus_locator/Components/Constants.dart';
import 'package:bus_locator/Components/RoundedButton.dart';
import 'package:bus_locator/Payment/screens/paymentscreen.dart';
import 'package:bus_locator/screens/Reset%20Password.dart';
import 'package:bus_locator/screens/Welcome%20Screen.dart';
import 'package:bus_locator/screens/profileScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bus_locator/Components/reusableCard.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProfile extends StatefulWidget {
  static String id = 'cartprofile_Screen';
  @override
  _CartProfileState createState() => _CartProfileState();
}

class _CartProfileState extends State<CartProfile> {
  @override
  Widget build(BuildContext context) {
    final _bloc = BlocProvider.of<AuthBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: Center(
          child: Text(
            'PROFILE',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        child: Container(
          color: kPageBackgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              BusCardProfilePage(
                name: 'John Doe',
                email: 'john@gmail.com',
                place: 'Gotham',
              ),
              SizedBox(
                height: 220,
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: RoundedButton(
                      minWidth: 370,
                      color: kButtonDarkColor,
                      text: "Change Password",
                      textColor: kButtonActiveColor,
                      textSize: 18,
                      onPress: () {
                        _bloc.add(RequestChangePassword());
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: RoundedButton(
                      minWidth: 370,
                      color: kButtonActiveColor,
                      text: "Logout",
                      textColor: Colors.white,
                      textSize: 18,
                      onPress: () {
                        _bloc.add(Logout());
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        listener: (BuildContext context, AuthState state) {
          if (state is LogoutSuccess) {
            Navigator.pushReplacementNamed(context, WelcomeScreen.id);
          } else if (state is CanChangePassword) {
            Navigator.pushNamed(context,ResetPassword.id);
          } else if (state is CannotChangePassword) {
            showInSnackBar(context, state.message);
          }
        },
      ),
    );
  }
}

class BusCardProfilePage extends StatelessWidget {
  final String name;
  final String email;
  final String place;

  BusCardProfilePage({this.name, this.email, this.place});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: ReusableCard(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0)),
              cardChild: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 30.0,
                      child: Icon(
                        Icons.directions_bus,
                        color: Colors.white,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          name,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          email,
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          place,
                          style: TextStyle(
                              color: Colors.greenAccent,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              colour: Color(0xFF28284D),
              onPress: () {
                Navigator.pushNamed(context, ProfileScreen.id);
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: ReusableCard(
              cardChild: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 55,
                  child: Center(
                    child: Text(
                      'Edit Profile',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
              ),
              colour: Color(0xFF242448),
              onPress: () {},
            ),
          ),
        ],
      ),
    );
  }
}
