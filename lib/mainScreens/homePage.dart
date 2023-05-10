// ignore_for_file: prefer_const_constructors

import 'package:codelibrary/colors.dart';
import 'package:codelibrary/mainScreens/myHome.dart';
import 'package:codelibrary/mainScreens/profile.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List tabs = [MyHome(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          currentIndex: _currentIndex,
          backgroundColor: navBgcolor,
          selectedItemColor: simpleWhite,
          unselectedItemColor: lightWhite,

          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ]),
          body: tabs[_currentIndex],
      backgroundColor: screenBgcolor,
    );
  }
}

