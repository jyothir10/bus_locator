import 'dart:async';
import 'dart:typed_data';
import 'package:bus_locator/Components/BottomBar.dart';
import 'package:bus_locator/Components/Constants.dart';
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
  StreamSubscription _locationSubscription;
  Location _locationTracker = Location();
  Marker marker;
  Circle circle;
  GoogleMapController _controller;

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
          radius: newLocalData.accuracy,
          zIndex: 1,
          strokeColor: Colors.blue,
          center: latlng,
          fillColor: Colors.blue.withAlpha(70));
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
    String hintText1 = 'From';
    String hintText2 = "To";
    return Scaffold(
      bottomNavigationBar: BottomBar(),
      appBar: AppBar(
        backgroundColor: kAppBarColor,
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
            Container(
              color: kBottomBarColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 7),
                              child: Icon(
                                FontAwesomeIcons.dotCircle,
                                size: 20,
                                color: Colors.white30,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: TextField(
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF28284D),
                                      ),
                                    ),
                                    hintText: hintText1,
                                    hintStyle: TextStyle(color: Colors.white),
                                  ),
                                  controller: _controller2,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                  onChanged: (value) {
                                    //TODO:Starting point selection
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: DotsIndicator(
                          dotsCount: 4,
                          axis: Axis.vertical,
                          decorator: DotsDecorator(
                            size: Size(2, 2),
                            color: Colors.white30,
                            activeColor: Colors.white30,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 7),
                              child: Icon(
                                Icons.location_on,
                                color: Colors.red,
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFF28284D),
                                    ),
                                  ),
                                  hintText: hintText2,
                                  hintStyle: TextStyle(color: Colors.white),
                                ),
                                controller: _controller2,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                                onChanged: (value) {
                                  hintText2 = value;
                                  //TODO:Destination point selection
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 15, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, Destination.id);
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.white.withOpacity(0.8),
                                radius: 25,
                                child: Icon(
                                  Icons.card_travel,
                                  color: kPageBackgroundColor,
                                  size: 35,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
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
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.location_searching),
          onPressed: () {
            getCurrentLocation();
          }),
    );
  }
}
