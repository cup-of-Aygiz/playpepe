import 'package:flutter/material.dart';
import 'package:game_of_pepe/repository/shared_prefs_repo.dart';
import 'package:game_of_pepe/ui/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FightPage extends StatefulWidget {
  @override
  _FightPageState createState() => _FightPageState();
}

class _FightPageState extends State<FightPage> {
  double _numberOfClicks = 0;
  double _clickPower = 1;
  var _pers = "Pers";
  static const Duration _animationDuration = AppAnimation.animationDuration;
  static const TextStyle _styleText = AppText.textStyle;

  void _click() {
    setState(() {
      _numberOfClicks += _clickPower;
      SharedPrefsRepo.writeClick(_numberOfClicks);
      _pers = _pers == "Pers" ? "boss" : "Pers";
    });
    Future.delayed(_animationDuration, () {
      setState(() {
        _pers = _pers == "Pers" ? "boss" : "Pers";
      });
    });
  }

  @override
  void initState() {
    SharedPrefsRepo.readClick().then((value) {
      if (value == null) return;
      setState(() {
        _numberOfClicks = value;
      });
    });
    SharedPrefsRepo.readPowerClick().then((value) {
      setState(() {
        _clickPower = value!;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _click(),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/gameimage/location/fon.jpg",
            ),
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
                '$_numberOfClicks',
                style: _styleText,
              ),
            ),
            Expanded(
              child: Container(
                height: AppSize.heroSizeBig,
                alignment: Alignment.center,
                child: AnimatedContainer(
                  height:
                      _pers == "Pers" ? AppSize.heroSize : AppSize.heroSizeBig,
                  duration: _animationDuration,
                  child: Image.asset("assets/gameimage/player/$_pers.png"),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Сила клика: $_clickPower',
                style: _styleText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
