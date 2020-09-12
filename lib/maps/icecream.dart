import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class Icecream extends StatefulWidget {
  @override
  _IcecreamState createState() => _IcecreamState();
}

class _IcecreamState extends State<Icecream> {
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
    LatLng pinPosition =
        LatLng(40.7272016, -73.8223414); //Max and Mina's Ice Cream Parlor
    LatLng pinPosition1 = LatLng(40.751113, -73.9971455); //Baskin Robbins
    LatLng pinPosition2 = LatLng(40.7569097, -73.9865975); //Hard Rock Cafe
    LatLng pinPosition3 =
        LatLng(40.7264906, -73.9841305); //Big Gay Ice Cream Shop

    String positionOne = "Max and Mina's Ice Cream Parlor";
    String positionTwo = "Baskin Robbins";
    String positionThree = "Hard Rock Cafe";
    String positionFour = "Big Gay Ice Cream Shop";
    CameraPosition initialLocation =
        CameraPosition(zoom: 10, bearing: 30, target: pinPosition);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Hexcolor('#D6F4FF'),
        title: Text(
          "Ice-Cream",
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
                markerId: MarkerId("Max and Mina's Ice Cream Parlor"),
                position: pinPosition,
                infoWindow: InfoWindow(
                  title: positionOne,
                  snippet: 'Ice-Cream',
                ),
                icon: pinLocationIcon));

            _markers.add(Marker(
                markerId: MarkerId("Baskin Robbins"),
                position: pinPosition1,
                infoWindow: InfoWindow(
                  title: positionTwo,
                  snippet: 'Ice-Cream',
                ),
                icon: pinLocationIcon));

            _markers.add(Marker(
                markerId: MarkerId("Hard Rock Cafe"),
                position: pinPosition2,
                infoWindow: InfoWindow(
                  title: positionThree,
                  snippet: 'Ice-Cream',
                ),
                icon: pinLocationIcon));

            _markers.add(Marker(
                markerId: MarkerId("Big Gay Ice Cream Shop"),
                position: pinPosition3,
                infoWindow: InfoWindow(
                  title: positionFour,
                  snippet: 'Ice-Cream',
                ),
                icon: pinLocationIcon));
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Hexcolor('#D6F4FF'),
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
