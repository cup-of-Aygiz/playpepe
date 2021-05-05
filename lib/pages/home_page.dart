import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _bossDamage = 0;
  double damagePlayer = 1;
  var pers = "assets/gameimage/player/Pers.png";

  void damage(TapDownDetails details) {
    setState(() {
      _bossDamage += damagePlayer;
      pers = pers == "assets/gameimage/player/Pers.png"
          ? "assets/gameimage/player/Persattack.png"
          : "assets/gameimage/player/Pers.png";
    });
    Future.delayed(const Duration(milliseconds: 50), () {
      setState(() {
        pers = pers == "assets/gameimage/player/Pers.png"
            ? "assets/gameimage/player/Persattack.png"
            : "assets/gameimage/player/Pers.png";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTapDown: (TapDownDetails details) => damage(details),
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
                  AnimatedContainer(
                    duration: Duration(milliseconds: 0),
                    alignment: Alignment(0, 1),
                    child: Container(
                      height: 100,
                      width: 100,
                      child: Image.asset('$pers'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
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
