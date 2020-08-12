import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var geolocator;
  var locationOptions;
  var currentLong;
  var currentLat;
  List<Marker> allMarkers = [];
  GoogleMapController _controller;

  void _getCurrentLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  @override
  void initState() {
    super.initState();
    allMarkers.add(Marker(
        markerId: MarkerId('myMarker'),
        draggable: true,
        onTap: () {
          print('Marker Tapped');
        },
        position: LatLng(30.033333, 31.233334)));

    geolocator = Geolocator();
    locationOptions =
        LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);

    StreamSubscription<Position> positionStream = geolocator
        .getPositionStream(locationOptions)
        .listen((Position position) {
      position == null
          ? {currentLong = 30.033333, currentLat = 31.233334}
          : {currentLong = position.longitude, currentLat = position.latitude};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Container(
          height: (MediaQuery.of(context).size.height / 2 ),
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
            initialCameraPosition:
                CameraPosition(target: LatLng(30.033333, 31.233334), zoom: 12.0),
            markers: Set.from(allMarkers),
            onMapCreated: mapCreated,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                child: Image.asset('images/pyramid.png'),
                width: 150,
                height: 150,
              ),
              FloatingActionButton.extended(
                onPressed: () {
                  movetoPyramids();
                  // Add your onPressed code here!
                },
                label: Text(
                  'Pyramids ?',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                backgroundColor: Color(0xffB37F27),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                child: Image.asset('images/tower.png'),
                width: 150,
                height: 100,
              ),
              FloatingActionButton.extended(
                onPressed: () {
                  movetoCairoTower();
                  // Add your onPressed code here!
                },
                label: Text(
                  'Cairo Tower ?',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                backgroundColor: Color(0xff3B6978),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                child: Image.asset('images/luxor.png'),
                width: 150,
                height: 100,
              ),
              FloatingActionButton.extended(
                onPressed: () {
                  movetoLuxor();
                  // Add your onPressed code here!
                },
                label: Text(
                  'Luxor ?',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                backgroundColor: Color(0xffA33A26),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                child: Image.asset('images/aswan.png'),
                width: 150,
                height: 100,
              ),
              FloatingActionButton.extended(
                onPressed: () {
                  movetoAswan();
                  // Add your onPressed code here!
                },
                label: Text(
                  'Aswan ?',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                backgroundColor: Color(0xff4c495f),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[

              FloatingActionButton.extended(
                onPressed: () {
                  movetoCurrentLocation();
                  // Add your onPressed code here!
                },
                label: Text(
                  'Current Location ?',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                backgroundColor: Colors.red,
              ),
            ],
          ),
        ),
      ]),
    );
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }

  movetoPyramids() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(29.976480, 31.131302), zoom: 12.0),
    ));
    setState(() {

    });
    allMarkers.clear();
    allMarkers.add(Marker(
        markerId: MarkerId('myMarker'),
        draggable: true,
        onTap: () {
          print('Marker Tapped');
        },
        position: LatLng(29.976480, 31.131302)));
  }
  movetoCairoTower() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(30.045916, 31.224291), zoom: 12.0),
    ));
    setState(() {

    });
    allMarkers.clear();
    allMarkers.add(Marker(
        markerId: MarkerId('myMarker'),
        draggable: true,
        onTap: () {
          print('Marker Tapped');
        },
        position: LatLng(30.045916, 31.224291)));
  }
  movetoCurrentLocation() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(currentLat, currentLong), zoom: 12.0),
    ));
    setState(() {

    });
    allMarkers.clear();
    allMarkers.add(Marker(
        markerId: MarkerId('myMarker'),
        draggable: true,
        onTap: () {
          print('Marker Tapped');
        },
        position: LatLng(currentLat, currentLong)));
  }
  movetoAswan() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(24.088938,32.899830), zoom: 12.0),
    ));
    setState(() {

    });
    allMarkers.clear();
    allMarkers.add(Marker(
        markerId: MarkerId('myMarker'),
        draggable: true,
        onTap: () {
          print('Marker Tapped');
        },
        position: LatLng(24.088938,32.899830)));
  }
  movetoLuxor() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng( 25.687243, 32.639637), zoom: 12.0),
    ));
    setState(() {

    });
    allMarkers.clear();
    allMarkers.add(Marker(
        markerId: MarkerId('myMarker'),
        draggable: true,
        onTap: () {
          print('Marker Tapped');
        },
        position: LatLng( 25.687243, 32.639637)));
  }
}
