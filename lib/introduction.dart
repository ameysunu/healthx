import 'package:flutter/material.dart';
import 'package:healthx/login.dart';
import 'package:hexcolor/hexcolor.dart';
import 'home.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Introduction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroductionPage(),
    );
  }
}

class IntroductionPage extends StatefulWidget {
  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle =
        TextStyle(fontSize: 19.0, fontFamily: 'Gotham', color: Colors.black);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.w700,
          fontFamily: 'Gotham',
          color: Colors.black),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );
    return Scaffold(
      backgroundColor: Hexcolor('#FFE8F7'),
      body: IntroductionScreen(
        key: introKey,
        pages: [
          PageViewModel(
            title: "HealthX",
            body: "Check out, restaurants and health at the same time",
            image: _buildImage('food'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Find your restaurants",
            body: "Get your nearest favorite food place restaurants.",
            image: _buildImage('google'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Symptom Survey",
            body: "Fill out symptoms to get you assistance.",
            image: _buildImage('tacos'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "You are all ready!",
            bodyWidget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Welcome to HealthX", style: bodyStyle),
              ],
            ),
            image: _buildImage('symptom'),
            decoration: pageDecoration,
          ),
        ],
        onDone: () => _onIntroEnd(context),
        showSkipButton: true,
        skipFlex: 0,
        nextFlex: 0,
        skip: const Text('Skip',
            style: TextStyle(fontFamily: 'Gotham', color: Colors.black)),
        next: const Icon(
          Icons.arrow_forward,
          color: Colors.black,
        ),
        done: const Text('Done',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'Gotham',
                color: Colors.black)),
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: Color(0xFFBDBDBD),
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
      ),
    );
  }
}

Widget _buildImage(String assetName) {
  return Align(
      child: Image.asset('images/$assetName.png', width: 350.0),
      alignment: Alignment.bottomCenter);
}
