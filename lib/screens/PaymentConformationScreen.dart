import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'TicketDetailsScreen.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:bus_locator/Components/Constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:bus_locator/Payment/screens/Reciept_screen.dart';

String rupee = '₹';

class PaymentConformation extends StatefulWidget {
  static String id = 'PaymentConformation_Screen';
  @override
  _PaymentConformationState createState() => _PaymentConformationState();
}

class _PaymentConformationState extends State<PaymentConformation> {
  static const platform = const MethodChannel("razorpay_flutter");
  TextEditingController _controller;

  Razorpay _razorpay;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.keyboard_backspace,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        color: kPageBackgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      'pay',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  LimitedBox(
                    maxWidth: 100,
                    child: Text(
                      rupee + ' ' + totalAmount.toString(),
                      style: TextStyle(
                          fontSize: 100,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: RaisedButton(
                      onPressed: openCheckout,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 35),
                        child: Text(
                          'confirm',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      color: kBottomBarActiveIconColor,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(2.0),
                      splashColor: Colors.blueAccent,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 35),
                        child: Text(
                          'cancel',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      color: Colors.blue,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(2.0),
                      splashColor: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_IQwhGvbvsOZmJ0',
      'amount': totalAmount * 100,
      'name': 'i-Bus',
      'description': 'Enfono Technologies',
      'prefill': {'contact': '', 'email': ''},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(msg: "SUCCESS: " + response.paymentId);
    Navigator.pushNamed(context, RecieptScreen.id);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
      msg: "ERROR: " + response.code.toString() + " - " + response.message,
      fontSize: 16,
      textColor: Colors.white,
      backgroundColor: kPageBackgroundColor,
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName,
        fontSize: 16,
        textColor: Colors.white,
        backgroundColor: kPageBackgroundColor);
  }
}
