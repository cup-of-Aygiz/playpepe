import 'dart:async';

import 'package:flutter/material.dart';
import 'package:game_of_pepe/ui/config.dart';

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

  Duration _animationDuration = AppAnimation.animationDuration;

  void _damage(TapDownDetails details) {
    setState(() {
      _bossDamage += _damagePlayer;
      _pers = _pers == "Pers" ? "boss" : "Pers";
    });
    Future.delayed(_animationDuration, () {
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

                /// TODO: move this text styles
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
              child: AnimatedContainer(
                height:
                    _pers == "Pers" ? AppSize.heroSize : AppSize.heroSizeBig,
                duration: _animationDuration,
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
            label: "124",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update),
            label: "124",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.aspect_ratio),
            label: "124",
          ),
        ],
      ),
    );
  }
}
