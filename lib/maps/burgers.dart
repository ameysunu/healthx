import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class Burgers extends StatefulWidget {
  @override
  _BurgersState createState() => _BurgersState();
}

class _BurgersState extends State<Burgers> {
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
    LatLng pinPosition = LatLng(40.6219444, -74.0225); //McDonald's
    LatLng pinPosition1 = LatLng(40.8012852, -73.9681784); //KFC
    LatLng pinPosition2 = LatLng(40.7569097, -73.9865975); //Wendy's
    LatLng pinPosition3 = LatLng(40.7265969, -74.00541); //ESSEN Fast Food

    String positionOne = "McDonald's";
    String positionTwo = "KFC";
    String positionThree = "Wendy's";
    String positionFour = "ESSEN Fast Food";
    CameraPosition initialLocation =
        CameraPosition(zoom: 10, bearing: 30, target: pinPosition);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Hexcolor('#E3E0F3'),
        title: Text(
          "Burger Joint",
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
                markerId: MarkerId("McDonald's"),
                position: pinPosition,
                infoWindow: InfoWindow(
                  title: positionOne,
                  snippet: 'Burger Joint',
                ),
                icon: pinLocationIcon));

            _markers.add(Marker(
                markerId: MarkerId("KFC"),
                position: pinPosition1,
                infoWindow: InfoWindow(
                  title: positionTwo,
                  snippet: 'Burger Joint',
                ),
                icon: pinLocationIcon));

            _markers.add(Marker(
                markerId: MarkerId("Wendy's"),
                position: pinPosition2,
                infoWindow: InfoWindow(
                  title: positionThree,
                  snippet: 'Burger Joint',
                ),
                icon: pinLocationIcon));

            _markers.add(Marker(
                markerId: MarkerId("ESSEN Fast Food"),
                position: pinPosition3,
                infoWindow: InfoWindow(
                  title: positionFour,
                  snippet: 'Burger Joint',
                ),
                icon: pinLocationIcon));
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Hexcolor('#E3E0F3'),
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
