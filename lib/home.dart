import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:healthx/login.dart';
import 'package:hexcolor/hexcolor.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.black,
              ),
              onPressed: () {
                signOutGoogle();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) {
                  return Login();
                }), ModalRoute.withName('/'));
              }),
        ],
        title: Text(
          "Hello $name",
          style: TextStyle(fontFamily: 'Gotham', color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  color: Hexcolor('#FFE8F7'),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 20, 10, 10),
                        child: Text(
                          "Symptoms",
                          style: TextStyle(
                              fontFamily: 'Gotham',
                              color: Colors.black,
                              fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 20.0),
                        child: Text(
                          "Feeling sick? Let's see how we can help?",
                          style: TextStyle(
                              fontFamily: 'Gotham',
                              color: Colors.black,
                              fontSize: 15),
                        ),
                      ),
                      Row(
                        children: [],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0, 10, 0),
                child: Card(
                  color: Hexcolor('#F2ECFF'),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width * 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                          child: Text(
                            "Water Calculator",
                            style:
                                TextStyle(fontFamily: 'Gotham', fontSize: 17),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                icon: Icon(
                                  Icons.remove,
                                  color: Colors.black,
                                ),
                                onPressed: () => _decrementCounter()),
                            Container(
                                height: 200,
                                width: 200,
                                child: Image.asset('images/water.png')),
                            IconButton(
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.black,
                                ),
                                onPressed: () => _incrementCounter()),
                          ],
                        ),
                        Text(
                          "$_counter",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Gotham',
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Restaurants",
                  style: TextStyle(fontFamily: 'Gotham', fontSize: 25),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
