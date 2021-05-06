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
  Duration _animationDuration = AppAnimation.animationDuration;
  TextStyle _styleText = AppText.textStyle;

  void _click(TapDownDetails details) {
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) => _click(details),
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
                alignment: Alignment(0, 0),
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
