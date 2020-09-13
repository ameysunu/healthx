import 'package:flutter/material.dart';
import 'package:healthx/bmival.dart';
import 'package:hexcolor/hexcolor.dart';

double height = double.parse(heightController.text);
double weight = double.parse(weightController.text);
var bmi = ((weight) / (height * height)).toStringAsFixed(3);

final heightController = TextEditingController();
final weightController = TextEditingController();

class BMI extends StatefulWidget {
  @override
  _BMIState createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Hexcolor('#FFE694'),
      appBar: AppBar(
        backgroundColor: Hexcolor('#FFE694'),
        iconTheme: IconThemeData(
          color: Hexcolor('#5C6178'),
        ),
        elevation: 0,
        title: Text(
          "BMI Calculator",
          style: TextStyle(
            fontFamily: 'Gotham',
            color: Hexcolor('#5C6178'),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Image.asset('images/bmi.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Enter your height",
                  style: TextStyle(fontFamily: 'Gotham', fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: TextFormField(
                  controller: heightController,
                  style: TextStyle(color: Colors.black, fontFamily: 'Gotham'),
                  decoration: new InputDecoration(
                    enabledBorder: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.black)),
                    hintStyle: TextStyle(
                      fontFamily: 'Gotham',
                      color: Colors.black54,
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                    ),
                    labelStyle:
                        TextStyle(fontFamily: 'Gotham', color: Colors.white),
                    hintText: 'In (metres)',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 20, 10, 10),
                child: Text(
                  "Enter your weight",
                  style: TextStyle(fontFamily: 'Gotham', fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: TextFormField(
                  controller: weightController,
                  style: TextStyle(color: Colors.black, fontFamily: 'Gotham'),
                  decoration: new InputDecoration(
                    enabledBorder: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.black)),
                    hintStyle: TextStyle(
                      fontFamily: 'Gotham',
                      color: Colors.black54,
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                    ),
                    labelStyle:
                        TextStyle(fontFamily: 'Gotham', color: Colors.white),
                    hintText: 'In (kilograms)',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RaisedButton(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Calculate",
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'Gotham'),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            return BMIValue();
                          },
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
