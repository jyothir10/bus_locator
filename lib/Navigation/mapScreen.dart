import 'dart:async';
import 'dart:typed_data';
import 'package:bus_locator/Authentication/ui/additionals.dart';
import 'package:bus_locator/Components/TopNav.dart';
import 'package:bus_locator/Components/Constants.dart';
import 'package:bus_locator/Components/TopNav.dart';
import 'package:bus_locator/screens/destination_screen.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  static const id = 'map_Screen';
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  TextEditingController _controller2;
  TextEditingController _controller3;
  StreamSubscription _locationSubscription;
  Location _locationTracker = Location();
  Marker marker;
  Circle circle;
  GoogleMapController _controller;

  void _setMapStyle() async {
    String style =
        await DefaultAssetBundle.of(context).loadString('assets/mapstyle.json');
    _controller.setMapStyle(style);
  }

  static final CameraPosition initialLocation = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 18.4746,
  );

  Future<Uint8List> getMarker() async {
    ByteData byteData =
        await DefaultAssetBundle.of(context).load("assets/car_icon.png");
    return byteData.buffer.asUint8List();
  }

  void updateMarkerAndCircle(LocationData newLocalData, Uint8List imageData) {
    LatLng latlng = LatLng(newLocalData.latitude, newLocalData.longitude);
    this.setState(() {
      marker = Marker(
          markerId: MarkerId("home"),
          position: latlng,
          rotation: newLocalData.heading,
          draggable: false,
          zIndex: 2,
          flat: true,
          anchor: Offset(0.5, 0.5),
          icon: BitmapDescriptor.fromBytes(imageData));
      circle = Circle(
          circleId: CircleId("car"),
          radius: 200, //newLocalData.accuracy,
          zIndex: 1,
          strokeColor: Colors.white24,
          center: latlng,
          fillColor: Colors.white.withAlpha(70));
    });
  }

  void getCurrentLocation() async {
    try {
      Uint8List imageData = await getMarker();
      var location = await _locationTracker.getLocation();

      updateMarkerAndCircle(location, imageData);

      if (_locationSubscription != null) {
        _locationSubscription.cancel();
      }

      _locationSubscription =
          _locationTracker.onLocationChanged().listen((newLocalData) {
        if (_controller != null) {
          _controller.animateCamera(CameraUpdate.newCameraPosition(
              new CameraPosition(
                  bearing: 192.8334901395799,
                  target: LatLng(newLocalData.latitude, newLocalData.longitude),
                  tilt: 0,
                  zoom: 15.00)));
          updateMarkerAndCircle(newLocalData, imageData);
        }
      });
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
      }
    }
  }

  @override
  void dispose() {
    if (_locationSubscription != null) {
      _locationSubscription.cancel();
    }
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    _setMapStyle();
    return Scaffold(
      backgroundColor: kPageBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kAppBarColor,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back,
            color: Colors.white70,
          ),
        ),
        title: Text(
          'MAP',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
//            TopNav(
//              hintText1: currentPlace,
//              controller2: _controller2,
//              onPressed: () => Navigator.pushNamed(context, Destination.id),
//              icon: Icon(
//                Icons.search,
//                size: 40,
//                color: kPageBackgroundColor,
//              ),
//            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(top: 5),
                width: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: kPageBackgroundColor,
                ),
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: initialLocation,
                  markers: Set.of((marker != null) ? [marker] : []),
                  circles: Set.of((circle != null) ? [circle] : []),
                  onMapCreated: (GoogleMapController controller) {
                    _controller = controller;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
              heroTag: 2,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.compare_arrows,
                color: kBottomBarColor,
                size: 35,
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        elevation: 16,
                        child: Container(
                          decoration: BoxDecoration(
                            color: kPageBackgroundColor,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          padding: EdgeInsets.all(10.0),
                          height: 170,
                          width: 400,
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                                  color: HexColor("#13132d"),
                                  height: 150,
                                  width: 369,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                5, 0, 0, 0),
                                            child: Column(
                                              children: <Widget>[
                                                Icon(
                                                  FontAwesomeIcons
                                                      .solidDotCircle,
                                                  color: Colors.grey,
                                                ),
                                                Icon(
                                                  FontAwesomeIcons.ellipsisV,
                                                  color: Colors.grey[100],
                                                  size: 20,
                                                ),
                                                Icon(FontAwesomeIcons.ellipsisV,
                                                    color: Colors.grey[100],
                                                    size: 20),
                                                Icon(
                                                  FontAwesomeIcons.mapMarkerAlt,
                                                  color: Colors.red,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                20, 0, 0, 0),
                                            child: Container(
                                              width: 240,
                                              child: Column(
                                                children: <Widget>[
                                                  TextField(
                                                    decoration: InputDecoration(
                                                      enabledBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xFF28284D),
                                                        ),
                                                      ),
                                                      hintText: currentPlace,
                                                      hintStyle: TextStyle(
                                                          color:
                                                              Colors.blueGrey,
                                                          fontSize: 18),
                                                    ),
                                                    controller: _controller2,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17,
                                                    ),
                                                    onChanged: (value) {
                                                      //TODO:Starting point selection
                                                    },
                                                  ),
                                                  TextField(
                                                    decoration: InputDecoration(
                                                      enabledBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xFF28284D),
                                                        ),
                                                      ),
                                                      hintText:
                                                          'choose destination',
                                                      hintStyle: TextStyle(
                                                          color:
                                                              Colors.blueGrey,
                                                          fontSize: 18),
                                                    ),
                                                    controller: _controller3,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17,
                                                    ),
                                                    onChanged: (value) {
                                                      //TODO:Destination point selection
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              }),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
              heroTag: 3,
              backgroundColor: Colors.white,
              child: Icon(
                FontAwesomeIcons.bus,
                color: kBottomBarColor,
                size: 30,
              ),
              onPressed: () {
                Navigator.pushNamed(context, Destination.id);
              }),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
              heroTag: 1,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.location_searching,
                color: kBottomBarColor,
                size: 35,
              ),
              onPressed: () {
                getCurrentLocation();
              }),
        ],
      ),
    );
  }
}
