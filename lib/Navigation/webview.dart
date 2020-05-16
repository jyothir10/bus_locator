import 'dart:async';

import 'package:bus_locator/Components/Constants.dart';
import 'package:bus_locator/Components/TopNav.dart';
import 'package:bus_locator/screens/destination_screen.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewMap extends StatefulWidget {
  static const id = 'webview_Screen';
  @override
  _WebViewMapState createState() => _WebViewMapState();
}

class _WebViewMapState extends State<WebViewMap> {
  Completer<WebViewController> _controller = Completer<WebViewController>();
  TextEditingController _controller2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back,
            color: Colors.white70,
          ),
        ),
        title: Center(
            child: Text(
          'MAP',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopNav(
              controller2: _controller2,
              onPressed: () => Navigator.pushNamed(context, Destination.id),
            ),
            Expanded(
              child: Container(
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: WebView(
                  initialUrl:
                      'https://www.google.com/maps/dir/Kannur,+Kerala/Dharmasala,+Kerala/@11.928751,75.3351575,13z/data=!3m1!4b1!4m13!4m12!1m5!1m1!1s0x3ba422b9b2aca753:0x380605a11ce24f6c!2m2!1d75.3703662!2d11.8744775!1m5!1m1!1s0x3ba43e44a99ada63:0x279f4178f3f56240!2m2!1d75.3791096!2d11.9832835',
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (WebViewController controller) {
                    _controller.complete(controller);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
