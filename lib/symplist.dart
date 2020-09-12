import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthx/symptoms.dart';
import 'package:healthx/user.dart';
import 'package:hexcolor/hexcolor.dart';
import 'login.dart';

Future<DocumentSnapshot> getUserInfo() async {
  var firebaseUser = await FirebaseAuth.instance.currentUser;
  return await FirebaseFirestore.instance.doc('users/symptom').get();
}

class SympList extends StatefulWidget {
  @override
  _SympListState createState() => _SympListState();
}

class _SympListState extends State<SympList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Hexcolor('#FFE8F7'),
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Hexcolor('#FFE8F7'),
        title: Text(
          "$name's Symptoms",
          style: TextStyle(color: Colors.black, fontFamily: 'Gotham'),
        ),
      ),
      body: Column(
        children: [
          Container(
            child: FutureBuilder(
              future: getUserInfo(),
              builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(
                            "Symptoms:\n" +
                                snapshot.data.data()['symptoms'] +
                                "\n\nHave you travelled outside the US within 14 days? If yes mention country(s):\n" +
                                snapshot.data.data()['travel'] +
                                "\n\nDo you have chest pain/breathing issues? Also mention if you are a frequent smoker:\n" +
                                snapshot.data.data()['smoker'] +
                                "\n\nEnter your kin's phone number:\n" +
                                snapshot.data.data()["kin's number"] +
                                "\n\nHave you been in contact with anyone who has COVID-19? If yes, do mention your exposure:\n" +
                                snapshot.data.data()["exposure"],
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Gotham',
                                fontSize: 16),
                          ),
                        );
                      });
                } else if (snapshot.connectionState == ConnectionState.none) {
                  return Text("No data");
                }
                return CircularProgressIndicator();
              },
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
                    "Delete",
                    style: TextStyle(color: Colors.white, fontFamily: 'Gotham'),
                  ),
                ],
              ),
              onPressed: () {
                update();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return Symptoms();
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void update() {
  firestoreInstance.collection("users").doc("symptom").update({
    "symptoms": "",
    "travel": "",
    "smoker": "",
    "kin's number": "",
    "exposure": "",
  }).then((value) {
    print("success");
  });
}
