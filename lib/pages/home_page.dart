import 'dart:async';

import 'package:flutter/material.dart';
import 'package:game_of_pepe/pages/shop_page.dart';
import 'package:game_of_pepe/pages/update_page.dart';

import 'fight_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final pages = [
    FightPage(),
    UpdatePage(),
    ShopPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            label: "click",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update),
            label: "update",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.aspect_ratio),
            label: "shop",
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
