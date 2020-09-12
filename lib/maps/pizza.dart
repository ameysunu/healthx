import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class Pizza extends StatefulWidget {
  @override
  _PizzaState createState() => _PizzaState();
}

class _PizzaState extends State<Pizza> {
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
    LatLng pinPosition = LatLng(40.734091, -74.006367); //Joe's Pizza
    LatLng pinPosition1 = LatLng(40.7971206, -73.9348001); //Patsy's Pizzeria
    LatLng pinPosition2 =
        LatLng(40.5758222, -73.9800833224914); //Grimaldi's Pizzeria
    LatLng pinPosition3 = LatLng(
        40.73697919999999, -73.81426893624825); //Gino's Pizzeria And Restaurant

    String positionOne = "Joe's Pizza";
    String positionTwo = "Patsy's Pizzeria";
    String positionThree = "Grimaldi's Pizzeria";
    String positionFour = "Gino's Pizzeria And Restaurant";
    CameraPosition initialLocation =
        CameraPosition(zoom: 10, bearing: 30, target: pinPosition);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Hexcolor('#EAC3C0'),
        title: Text(
          "Pizzeria",
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
                markerId: MarkerId("Joe's Pizza"),
                position: pinPosition,
                infoWindow: InfoWindow(
                  title: positionOne,
                  snippet: 'Pizzeria',
                ),
                icon: pinLocationIcon));

            _markers.add(Marker(
                markerId: MarkerId("Patsy's Pizzeria"),
                position: pinPosition1,
                infoWindow: InfoWindow(
                  title: positionTwo,
                  snippet: 'Pizzeria',
                ),
                icon: pinLocationIcon));

            _markers.add(Marker(
                markerId: MarkerId("Grimaldi's Pizzeria"),
                position: pinPosition2,
                infoWindow: InfoWindow(
                  title: positionThree,
                  snippet: 'Pizzeria',
                ),
                icon: pinLocationIcon));

            _markers.add(Marker(
                markerId: MarkerId("Gino's Pizzeria And Restaurant"),
                position: pinPosition3,
                infoWindow: InfoWindow(
                  title: positionFour,
                  snippet: 'Pizzeria',
                ),
                icon: pinLocationIcon));
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Hexcolor('#EAC3C0'),
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
