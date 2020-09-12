import 'package:flutter/material.dart';
import 'package:healthx/camera/cam.dart';
import 'package:healthx/home.dart';
import 'package:healthx/user.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    Home(),
    MyHomePage(),
    User(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Hexcolor('#FFDFCA'),
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          showSelectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home, color: Hexcolor('#5C6178')),
              title: new Text(
                'Home',
                style:
                    TextStyle(color: Hexcolor('#5C6178'), fontFamily: 'Gotham'),
              ),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.fastfood, color: Hexcolor('#5C6178')),
              title: new Text(
                'Food',
                style:
                    TextStyle(color: Hexcolor('#5C6178'), fontFamily: 'Gotham'),
              ),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.person, color: Hexcolor('#5C6178')),
              title: new Text(
                'User',
                style:
                    TextStyle(color: Hexcolor('#5C6178'), fontFamily: 'Gotham'),
              ),
            ),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
