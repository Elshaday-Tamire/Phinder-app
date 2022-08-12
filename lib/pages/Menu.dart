import 'package:final_project_app/home_screen.dart';
import 'package:final_project_app/pages/HealthTip2.dart';
import 'package:final_project_app/pages/share.dart';

import 'package:flutter/material.dart';

import 'healthtip.dart';
import 'homepage.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final screens = [
    HomePage(),
    HealthTip2(),
    HomeScreen(),
    SharePage(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) => Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color.fromRGBO(51, 83, 176, 1),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white70,
            currentIndex: currentIndex,
            //showUnselectedLabels: false,
            //iconSize: 40,
            onTap: (index) => setState(() => currentIndex = index),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                //backgroundColor: Colors.blue
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.health_and_safety),
                label: 'HelathTips',
                //backgroundColor: Colors.blue
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calculate),
                label: 'BMI',
                //backgroundColor: Colors.blue
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Setting',
                //backgroundColor: Colors.blue,
              ),
            ]),
      );
}
