import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_of_pepe/widgets/barriers.dart';
import 'package:game_of_pepe/widgets/bird.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _bossDamage = 980;

  void damage(TapDownDetails details) {
    setState(() {
      _bossDamage = _bossDamage - 30 <= 0 ? 980 : _bossDamage - 30;
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
              child: Container(
                alignment: Alignment.center,
                child: Text('$_bossDamage'),//pepe
                color: Colors.blue,
              ),
            ),
          ),
          Expanded(
              child: Container(
            color: Colors.green,
          ))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            title: Text("124"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ad_units),
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
