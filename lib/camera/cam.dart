import 'dart:io';

import 'package:flutter/material.dart';
import 'package:healthx/camera/chat.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:image_picker/image_picker.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File pickedImage;
  var text = '';

  bool imageLoaded = false;

  Future pickImage() async {
    var awaitImage = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      pickedImage = awaitImage;
      imageLoaded = true;
    });
    FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(pickedImage);
    TextRecognizer textRecognizer = FirebaseVision.instance.textRecognizer();
    VisionText visionText = await textRecognizer.processImage(visionImage);

    for (TextBlock block in visionText.blocks) {
      for (TextLine line in block.lines) {
        for (TextElement word in line.elements) {
          setState(() {
            text = text + word.text + ' ';
          });
        }
        text = text + '\n';
      }
    }
    textRecognizer.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Hexcolor('#FFDFCA'),
        child: Icon(
          Icons.chat,
          color: Hexcolor('#5C6178'),
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return Bot();
              },
            ),
          );
        },
      ),
      backgroundColor: Hexcolor('#F2ECFF'),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Food Scan",
                style: TextStyle(fontFamily: 'Gotham', fontSize: 20),
              ),
            ),
            SizedBox(height: 30.0),
            imageLoaded
                ? Center(
                    child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(blurRadius: 20),
                      ],
                    ),
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
                    height: 250,
                    child: Image.file(
                      pickedImage,
                      fit: BoxFit.cover,
                    ),
                  ))
                : Container(),
            SizedBox(height: 10.0),
            Center(
              child: InkWell(
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset('images/food.png'),
                ),
                onTap: () async {
                  pickImage();
                },
              ),
            ),
            SizedBox(height: 10.0),
            SizedBox(height: 10.0),
            text == ''
                ? Text(
                    'Tap and find out addresses.',
                    style: TextStyle(fontFamily: 'Gotham'),
                  )
                : Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          text,
                          style: TextStyle(fontFamily: 'Gotham'),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
