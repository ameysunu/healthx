import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final firstController = TextEditingController();
final secondController = TextEditingController();
final thirdController = TextEditingController();
final fourthController = TextEditingController();
final fifthController = TextEditingController();

final firestoreInstance = FirebaseFirestore.instance;

class Symptoms extends StatefulWidget {
  @override
  _SymptomsState createState() => _SymptomsState();
}

class _SymptomsState extends State<Symptoms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Hexcolor('#FFE8F7'),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "Symptoms",
          style: TextStyle(fontFamily: 'Gotham', color: Colors.black),
        ),
      ),
      backgroundColor: Hexcolor('#FFE8F7'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Image.asset('images/symptom.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Mention any specific symptoms",
                style: TextStyle(fontFamily: 'Gotham', fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: TextFormField(
                controller: firstController,
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
                  hintText: 'Headache, cough, cold etc.',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 20, 10, 10),
              child: Text(
                "Have you travelled abroad anywhere within the last 14 days. If yes, mention the country(s).",
                style: TextStyle(fontFamily: 'Gotham', fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: TextFormField(
                controller: secondController,
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
                  hintText: 'China, Israel, UK etc.',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Text(
                "Do you have chest pain/breathing issues? Also mention if you are a frequent smoker.",
                style: TextStyle(fontFamily: 'Gotham', fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: TextFormField(
                controller: thirdController,
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
                  hintText: 'Yes or no.',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 20, 10, 10),
              child: Text(
                "Enter your kin's phone number.",
                style: TextStyle(fontFamily: 'Gotham', fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: TextFormField(
                controller: fourthController,
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
                  hintText: '+1(234)567-890',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 20, 10, 10),
              child: Text(
                "Have you been in contact with anyone who has COVID-19? If yes, do mention your exposure.",
                style: TextStyle(fontFamily: 'Gotham', fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
              child: TextFormField(
                controller: fifthController,
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
                  hintText: 'Yes or No',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RaisedButton(
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Submit",
                      style:
                          TextStyle(fontFamily: 'Gotham', color: Colors.white),
                    ),
                  ],
                ),
                onPressed: () {
                  add();
                  _submitDialog(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void add() {
  firestoreInstance.collection("users").doc("symptom").update({
    "symptoms": firstController.text,
    "travel": secondController.text,
    "smoker": thirdController.text,
    "kin's number": fourthController.text,
    "exposure": fifthController.text,
  }).then((value) {
    print("success");
  });
}

void _submitDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Hexcolor('#FFE8F7'),
          title: Center(
            child: Text(
              "Submit responses?",
              style: TextStyle(fontFamily: 'Gotham'),
            ),
          ),
          content: RaisedButton(
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Submit",
                  style: TextStyle(color: Colors.white, fontFamily: 'Gotham'),
                ),
              ],
            ),
            onPressed: () {
              clearText();
              Navigator.pop(context);
            },
          ),
        );
      });
}

clearText() {
  firstController.clear();
  secondController.clear();
  thirdController.clear();
  fourthController.clear();
  fifthController.clear();
}
