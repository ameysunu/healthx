import 'package:flutter/material.dart';
import 'package:healthx/bmi.dart';
import 'package:healthx/login.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pedometer/pedometer.dart';
import 'package:url_launcher/url_launcher.dart';

String formatDate(DateTime d) {
  return d.toString().substring(0, 19);
}

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  Stream<StepCount> _stepCountStream;
  Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', _steps = '?';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      _steps = event.steps.toString();
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

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
                                  fontSize: 14),
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
                                "$_steps/6000",
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
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 0, 10, 0),
                    child: InkWell(
                      child: Card(
                        color: Hexcolor('#FFE694'),
                        child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("images/calculator.png"),
                                fit: BoxFit.contain,
                              ),
                            ),
                            height: MediaQuery.of(context).size.height * 0.24,
                            width: MediaQuery.of(context).size.width * 0.43,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    "BMI Calculator",
                                    style: TextStyle(
                                        color: Hexcolor('#5C6178'),
                                        fontFamily: 'Gotham',
                                        fontSize: 20),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return BMI();
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 0, 10, 0),
                    child: InkWell(
                      child: Card(
                        color: Hexcolor('#C8FCEA'),
                        child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("images/newspaper.png"),
                                fit: BoxFit.contain,
                              ),
                            ),
                            height: MediaQuery.of(context).size.height * 0.24,
                            width: MediaQuery.of(context).size.width * 0.43,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    "Health News",
                                    style: TextStyle(
                                        color: Hexcolor('#5C6178'),
                                        fontFamily: 'Gotham',
                                        fontSize: 20),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      onTap: () {
                        _launchURL();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_launchURL() async {
  const url = 'https://www.bbc.com/news/health';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
