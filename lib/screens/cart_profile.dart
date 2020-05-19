import 'package:bus_locator/Authentication/bloc/auth_bloc.dart';
import 'package:bus_locator/Authentication/bloc/auth_event.dart';
import 'package:bus_locator/Authentication/bloc/auth_state.dart';
import 'package:bus_locator/Authentication/ui/additionals.dart';
import 'package:bus_locator/Components/Constants.dart';
import 'package:bus_locator/Components/RoundedButton.dart';
import 'package:bus_locator/Payment/screens/paymentscreen.dart';
import 'package:bus_locator/Users/bloc/user_bloc.dart';
import 'ResetPassword.dart';
import 'package:bus_locator/screens/WelcomeScreen.dart';
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
  UserBloc _userBloc;
  @override
  void initState() {
    super.initState();
    _userBloc = UserBloc();
  }

  @override
  void dispose() {
    super.dispose();
    _userBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    final _authBloc = BlocProvider.of<AuthBloc>(context);
    _userBloc.add(UserProfile());
    return Scaffold(
      backgroundColor: kPageBackgroundColor,
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
        child: BlocBuilder<UserBloc, UserState>(
            bloc: _userBloc,
            builder: (BuildContext context, UserState state) {
              if (state is UserProfileSuccess) {
                return profilePageBuilder(context, state.userInfo);
              } else if (state is UserProfileFailure) {
                return Text(state.message);
              } else
                // TODO (shameem) Put loading widget
                return CircularProgressIndicator();
            }),
        listener: (BuildContext context, AuthState state) {
          if (state is LogoutSuccess) {
            Navigator.pushReplacementNamed(context, WelcomeScreen.id);
          } else if (state is CannotChangePassword) {
            showInSnackBar(context, state.message);
          }
        },
      ),
    );
  }
}

Widget profilePageBuilder(BuildContext context, Map userInfo) {
  final _authBloc = BlocProvider.of<AuthBloc>(context);
  return Container(
    color: kPageBackgroundColor,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        BusCardProfilePage(
          name: userInfo["name"],
          email: userInfo["email"],
          place: userInfo["place"],
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
                  Navigator.pushNamed(context, ResetPassword.id);
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
                  _authBloc.add(Logout());
                },
              ),
            ),
          ],
        )
      ],
    ),
  );
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              fontSize: 14),
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
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardChild: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 55,
                  child: Center(
                    child: GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, ProfileScreen.id),
                      child: Text(
                        'Edit',
                        style: TextStyle(
                          color: Colors.red,
                        ),
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
            ),
          ),
        ],
      ),
    );
  }
}
