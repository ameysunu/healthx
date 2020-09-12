import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class Tacos extends StatefulWidget {
  @override
  _TacosState createState() => _TacosState();
}

class _TacosState extends State<Tacos> {
  MapType _currentMapType = MapType.normal;
  BitmapDescriptor pinLocationIcon;
  Set<Marker> _markers = {};
  Completer<GoogleMapController> _controller = Completer();
  @override
  void initState() {
    super.initState();
    setCustomMapPin();
  }

  void setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAsset('images/marker.bmp');
  }

  @override
  Widget build(BuildContext context) {
    LatLng pinPosition = LatLng(40.713050, -74.007230); //Taco Spot- NYC
    LatLng pinPosition1 =
        LatLng(40.717370, -73.934050); //Homemade Taqueria Maspeth
    LatLng pinPosition2 =
        LatLng(40.643430, -74.079210); //Taqueria St. Marks Place New York
    LatLng pinPosition3 =
        LatLng(40.713054, -74.007228); //El Vez and Burrito Bar

    String positionOne = "Taco Spot- NYC";
    String positionTwo = "Homemade Taqueria Maspeth";
    String positionThree = "Taqueria St. Marks Place New York";
    String positionFour = "El Vez and Burrito Bar";
    CameraPosition initialLocation =
        CameraPosition(zoom: 10, bearing: 30, target: pinPosition);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Hexcolor('#FFE694'),
        title: Text(
          "Tacos",
          style: TextStyle(fontFamily: 'Gotham', color: Colors.black),
        ),
      ),
      body: GoogleMap(
        mapType: _currentMapType,
        myLocationEnabled: true,
        markers: _markers,
        initialCameraPosition: initialLocation,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          setState(() {
            _markers.add(Marker(
                markerId: MarkerId("Taco Spot- NY"),
                position: pinPosition,
                infoWindow: InfoWindow(
                  title: positionOne,
                  snippet: 'Taco Restaurant',
                ),
                icon: pinLocationIcon));

            _markers.add(Marker(
                markerId: MarkerId("Homemade Taqueria Maspeth"),
                position: pinPosition1,
                infoWindow: InfoWindow(
                  title: positionTwo,
                  snippet: 'Taco Restaurant',
                ),
                icon: pinLocationIcon));

            _markers.add(Marker(
                markerId: MarkerId("Taqueria St. Marks Place New York"),
                position: pinPosition2,
                infoWindow: InfoWindow(
                  title: positionThree,
                  snippet: 'Taco Restaurant',
                ),
                icon: pinLocationIcon));

            _markers.add(Marker(
                markerId: MarkerId("El Vez and Burrito Bar"),
                position: pinPosition3,
                infoWindow: InfoWindow(
                  title: positionFour,
                  snippet: 'Taco Restaurant',
                ),
                icon: pinLocationIcon));
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Hexcolor('#FFE694'),
        child: Icon(
          Icons.map,
          color: Colors.black,
        ),
        onPressed: () {
          setState(() {
            _currentMapType = _currentMapType == MapType.normal
                ? MapType.satellite
                : MapType.normal;
          });
        },
      ),
    );
  }
}
