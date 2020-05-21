import 'package:bus_locator/Components/TabBar.dart';
import 'package:bus_locator/Navigation/mapScreen.dart';
import 'package:bus_locator/Navigation/webview.dart';
import 'package:bus_locator/Payment/screens/Reciept_screen.dart';
import 'package:bus_locator/Payment/screens/paymentscreen.dart';
import 'package:bus_locator/Rating/screens/rating_screen.dart';
import 'package:bus_locator/screens/CartScreen.dart';
import 'package:bus_locator/screens/TicketDetailsScreen.dart';
import 'package:bus_locator/screens/cart_profile.dart';
import 'package:bus_locator/screens/destination_screen.dart';
import 'package:bus_locator/screens/orderScreen.dart';
import 'package:bus_locator/screens/profileScreen.dart';
import 'package:bus_locator/screens/ticket.dart';
import 'package:bus_locator/screens/ticketList.dart';
import 'package:bus_locator/splash/splash_screens.dart';
import 'Authentication/bloc/auth_bloc.dart';
import 'Authentication/ui/Register_screen.dart';
import 'Authentication/ui/login_screen.dart';
import 'homePage.dart';
import 'package:flutter/material.dart';
import 'Authentication/ui/login_page.dart';
import 'screens/WelcomeScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bus_locator/screens/TutorialScreen.dart';
import 'package:bus_locator/screens/BusDetailsScreen.dart';
import 'package:bus_locator/screens/ResetPassword.dart';
import 'package:bus_locator/screens/PaymentConformationScreen.dart';

void main() => runApp(new MyApp1());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      routes: {
        HomePage.id: (context) => HomePage(),
        LoginPage.id: (context) => LoginPage(),
        LoginScreen.id: (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        Destination.id: (context) => Destination(),
        CartScreen.id: (context) => CartScreen(),
        MapScreen.id: (context) => MapScreen(),
        CartProfile.id: (context) => CartProfile(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        TabBarClass.id: (context) => TabBarClass(),
        PaymentScreen.id: (context) => PaymentScreen(),
        TutorialScreen.id: (context) => TutorialScreen(),
        OrderScreen.id: (context) => OrderScreen(),
        BusDetails.id: (context) => BusDetails(),
        RecieptScreen.id: (context) => RecieptScreen(),
        ProfileScreen.id: (context) => ProfileScreen(),
        TicketScreen.id: (context) => TicketScreen(),
        RateScreen.id: (context) => RateScreen(),
        ResetPassword.id: (context) => ResetPassword(),
        WebViewMap.id: (context) => WebViewMap(),
        TicketDetails.id: (context) => TicketDetails(),
        TicketList.id: (context) => TicketList(),
        PaymentConformation.id: (context) => PaymentConformation(),
      },
      debugShowCheckedModeBanner: false,
      title: 'TheGorgeousLogin',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PaymentConformation(),
    );
  }
}

class MyApp1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp1State();
  }
}

class _MyApp1State extends State<MyApp1> {
  AuthBloc _bloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc = AuthBloc(),
      child: MyApp(),
    );
  }
}
