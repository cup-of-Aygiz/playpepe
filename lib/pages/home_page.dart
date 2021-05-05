import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

/// TODO:
/// надо home page сделать отдельным экраном
/// а подэкраны отдельными файлами - например fight_sub_page.dart
class _HomePageState extends State<HomePage> {
  double _bossDamage = 0;
  double _damagePlayer = 1;
  var _pers = "Pers";

  void _damage(TapDownDetails details) {
    setState(() {
      _bossDamage += _damagePlayer;
      _pers = _pers == "Pers" ? "boss" : "Pers";
    });
    Future.delayed(const Duration(milliseconds: 50), () {
      setState(() {
        _pers = _pers == "Pers" ? "boss" : "Pers";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTapDown: (TapDownDetails details) => _damage(details),

        /// TODO: refactor [Stack] to [Column]
        child: Stack(
          children: [
            Container(
              alignment: Alignment(0, -0.6),
              child: Text(
                '$_bossDamage',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.deepPurple,
                  fontSize: 20,
                ),
              ),
              color: Colors.blue,
            ),
            Center(
              child: Image.asset("assets/gameimage/player/boss.png"),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 100,
                width: 100,
                child: Image.asset("assets/gameimage/player/$_pers.png"),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            title: Text("124"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update),
            title: Text("124"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.aspect_ratio),
            title: Text("124"),
          ),
        ],
      ),
    );
  }
}
