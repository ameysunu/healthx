import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:healthx/bmi.dart';

class BMIValue extends StatefulWidget {
  @override
  _BMIValueState createState() => _BMIValueState();
}

class _BMIValueState extends State<BMIValue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Body Mass Index",
                style: TextStyle(
                    color: Colors.black, fontFamily: 'Gotham', fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                bmi.toString(),
                style: TextStyle(
                    color: Colors.black, fontFamily: 'Gotham', fontSize: 40),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset('images/health.png'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 20, 10, 10),
              child: Center(
                child: Text(
                  "Keep exercising and maintain good diet!",
                  style: TextStyle(fontFamily: 'Gotham', fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
