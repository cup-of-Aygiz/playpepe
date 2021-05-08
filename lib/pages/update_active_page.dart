import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_of_pepe/repository/shared_prefs_repo.dart';
import 'package:game_of_pepe/ui/config.dart';
import 'package:game_of_pepe/widgets/active_update_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ActivePage extends StatefulWidget {
  @override
  _ActivePageState createState() => _ActivePageState();
}

class _ActivePageState extends State<ActivePage> {
  late double _numberOfClicks;
  late double _clickPower = 1;
  late int _numberOfUpdate = 0;
  late num _costUpdate = _calculate(_numberOfUpdate);
  static const Duration _animationDuration = AppAnimation.animationDuration;
  static const TextStyle _styleText = AppText.textStyleToUpdate;

  void initState() {
    SharedPrefsRepo.readClick().then((value) {
      if (value == null) return;
      setState(() {
        _numberOfClicks = value;
      });
    });
    SharedPrefsRepo.readPowerClick().then((value) {
      if (value == null) return;
      setState(() {
        _clickPower = value;
      });
    });
    SharedPrefsRepo.readUpdateClick('1').then((value) {
      if (value == null) return;
      setState(() {
        _numberOfUpdate = value;
        _costUpdate = _calculate(_numberOfUpdate);
      });
    });
    super.initState();
  }

  num _calculate(int value) {
    return 12 + 12 * pow(1.07, value);
  }

  void _addClick() {
    if (_numberOfClicks >= _calculate(_numberOfUpdate).round()) {
      setState(() {
        _numberOfClicks -= _calculate(_numberOfUpdate).round();
        SharedPrefsRepo.writeClick(_numberOfClicks);
        _clickPower++;
        SharedPrefsRepo.writePowerClick(_clickPower);
        _numberOfUpdate++;
        SharedPrefsRepo.writeUpdateClick(_numberOfUpdate,'1');
        _costUpdate = _calculate(_numberOfUpdate);
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
        ActiveUpdateWidget(
          titleText: _numberOfUpdate,
          costText: _costUpdate.round(),
          onTap: _addClick,
          iconImage: "assets/gameimage/icons/first.png",
        ),
        ActiveUpdateWidget(
          titleText: _numberOfUpdate,
          costText: _costUpdate.round(),
          onTap: _addClick,
          iconImage: "assets/gameimage/icons/second.png",
        ),
        ActiveUpdateWidget(
          titleText: _numberOfUpdate,
          costText: _costUpdate.round(),
          onTap: _addClick,
          iconImage: "assets/gameimage/icons/third.png",
        ),
        ActiveUpdateWidget(
          titleText: _numberOfUpdate,
          costText: _costUpdate.round(),
          onTap: _addClick,
          iconImage: "assets/gameimage/icons/fourth.png",
        ),
        ActiveUpdateWidget(
          titleText: _numberOfUpdate,
          costText: _costUpdate.round(),
          onTap: _addClick,
          iconImage: "assets/gameimage/icons/fifth.png",
        ),
        ActiveUpdateWidget(
          titleText: _numberOfUpdate,
          costText: _costUpdate.round(),
          onTap: _addClick,
          iconImage: "assets/gameimage/icons/sixth.png",
        ),
        ActiveUpdateWidget(
          titleText: _numberOfUpdate,
          costText: _costUpdate.round(),
          onTap: _addClick,
          iconImage: "assets/gameimage/icons/seventh.png",
        ),
        ActiveUpdateWidget(
          titleText: _numberOfUpdate,
          costText: _costUpdate.round(),
          onTap: _addClick,
          iconImage: "assets/gameimage/icons/eighth.png",
        ),
        ActiveUpdateWidget(
          titleText: _numberOfUpdate,
          costText: _costUpdate.round(),
          onTap: _addClick,
          iconImage: "assets/gameimage/icons/ninth.png",
        ),
        ActiveUpdateWidget(
          titleText: _numberOfUpdate,
          costText: _costUpdate.round(),
          onTap: _addClick,
          iconImage: "assets/gameimage/icons/tenth.png",
        ),
        ActiveUpdateWidget(
          titleText: _numberOfUpdate,
          costText: _costUpdate.round(),
          onTap: _addClick,
          iconImage: "assets/gameimage/icons/eleventh.png",
        ),
      ],
    );
    ;
  }
}
