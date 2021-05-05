import 'package:flutter/material.dart';
import 'package:game_of_pepe/ui/config.dart';

class FightPage extends StatefulWidget {
  @override
  _FightPageState createState() => _FightPageState();
}

class _FightPageState extends State<FightPage> {
  double _bossDamage = 0;
  double _damagePlayer = 1;
  var _pers = "Pers";
  Duration _animationDuration = AppAnimation.animationDuration;
  TextStyle _styleText = AppText.textStyle;

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
    return GestureDetector(
      onTapDown: (TapDownDetails details) => _damage(details),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/gameimage/player/boss.png"),
          ),
        ),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).padding.top,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                '$_bossDamage',
                style: _styleText,
              ),
              color: Colors.blue,
            ),
            Expanded(
              child: Center(
                child: Image.asset("assets/gameimage/player/boss.png"),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: AppSize.heroSizeBig,
                alignment: Alignment.bottomCenter,
                child: AnimatedContainer(
                  height:
                      _pers == "Pers" ? AppSize.heroSize : AppSize.heroSizeBig,
                  duration: _animationDuration,
                  child: Image.asset("assets/gameimage/player/$_pers.png"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
