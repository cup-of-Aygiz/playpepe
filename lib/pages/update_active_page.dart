import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_of_pepe/repository/shared_prefs_repo.dart';
import 'package:game_of_pepe/ui/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ActivePage extends StatefulWidget {
  @override
  _ActivePageState createState() => _ActivePageState();
}

class _ActivePageState extends State<ActivePage> {
  late double _numberOfClicks;
  late double _clickPower = 1;
  late int _numberOfUpdate = 0;
  late num _costUpdate = 12+10*pow(1.07,_numberOfUpdate);
  static const Duration _animationDuration = AppAnimation.animationDuration;
  TextStyle _styleText = AppText.textStyleToUpdate;
  void initState() {
    SharedPrefsRepo.readClick().then((value) {
      if (value == null) return;
      setState(() {
        _numberOfClicks = value;
      });
    });
    SharedPrefsRepo.readPowerClick().then((value) {
      if (value == null) return _clickPower = 1;
      setState(() {
        _clickPower = value;
      });
    });
    SharedPrefsRepo.readUpdateClick().then((value) {
      if (value == null) return _numberOfUpdate = 0;
      setState(() {
        _numberOfUpdate = value;
        _costUpdate = 12+10*pow(1.07,_numberOfUpdate);
      });
    });
    super.initState();
  }
  void _addClick(TapDownDetails details) {
    if (_numberOfClicks >= (12+10*pow(1.07,_numberOfUpdate)).round()) {
      setState(() {
        _numberOfClicks-= (12+10*pow(1.07,_numberOfUpdate)).round();
        SharedPrefsRepo.writeClick(_numberOfClicks);
        _clickPower++;
        SharedPrefsRepo.writePowerClick(_clickPower);
        _numberOfUpdate++;
        SharedPrefsRepo.writeUpdateClick(_numberOfUpdate);
        _costUpdate = 12+10*pow(1.07,_numberOfUpdate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        GestureDetector(
          onTapDown: (TapDownDetails details) => _addClick(details),
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Text("Кло-во улучшений $_numberOfUpdate",style: _styleText,),
                Expanded(
                  child: AnimatedContainer(
                    //height: AppSize.heroSize : AppSize.heroSizeBig,
                    duration: _animationDuration,
                    child: Image.asset(
                      "assets/gameimage/icons/tap.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text("Стоимость улучшения ${_costUpdate.round()}",style: _styleText,),
              ],
            ),
            color: Colors.teal[100],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text('Heed not the rabble'),
          color: Colors.teal[200],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text('Sound of screams but the'),
          color: Colors.teal[300],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text('Who scream'),
          color: Colors.teal[400],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text('Revolution is coming...'),
          color: Colors.teal[500],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text('Revolution, they...'),
          color: Colors.teal[600],
        ),
      ],
    );
    ;
  }
}
