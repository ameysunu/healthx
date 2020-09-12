import 'package:flutter/material.dart';
import 'package:healthx/login.dart';
import 'package:hexcolor/hexcolor.dart';

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Hexcolor('#FFDFCA'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  color: Hexcolor('#FFE8F7'),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Hexcolor('#FFE8F7'),
                          backgroundImage: NetworkImage(imageUrl),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              name,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Gotham',
                                  fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              email,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Gotham',
                                  fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0, 10, 10),
                child: Card(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/walk.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: MediaQuery.of(context).size.height * 0.38,
                    width: MediaQuery.of(context).size.width * 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "678/6000",
                                style: TextStyle(
                                    color: Hexcolor('#5C6178'),
                                    fontFamily: 'Gotham',
                                    fontSize: 40),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 0, 10, 10),
                          child: Text(
                            "Daily Steps",
                            style: TextStyle(
                                color: Hexcolor('#5C6178'),
                                fontFamily: 'Gotham',
                                fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
