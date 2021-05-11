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
  late List<int> _numberOfUpdate = [0, 0, 0, 0, 0, 0, 0, 0, 0];
  late List<double> _costUpdate = [
    _calculate(_numberOfUpdate[0], 1),
    _calculate(_numberOfUpdate[1], 1),
    _calculate(_numberOfUpdate[2], 2),
    _calculate(_numberOfUpdate[3], 3),
    _calculate(_numberOfUpdate[4], 4),
    _calculate(_numberOfUpdate[5], 5),
    _calculate(_numberOfUpdate[6], 6),
    _calculate(_numberOfUpdate[7], 7),
    _calculate(_numberOfUpdate[8], 8)
  ];
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
        _numberOfUpdate[1] = value;
        _costUpdate[1] = _calculate(_numberOfUpdate[1], 1);
      });
    });
    SharedPrefsRepo.readUpdateClick('2').then((value) {
      if (value == null) return;
      setState(() {
        _numberOfUpdate[2] = value;
        _costUpdate[2] = _calculate(_numberOfUpdate[2], 1);
      });
    });
    SharedPrefsRepo.readUpdateClick('3').then((value) {
      if (value == null) return;
      setState(() {
        _numberOfUpdate[3] = value;
        _costUpdate[3] = _calculate(_numberOfUpdate[3], 1);
      });
    });
    SharedPrefsRepo.readUpdateClick('4').then((value) {
      if (value == null) return;
      setState(() {
        _numberOfUpdate[4] = value;
        _costUpdate[4] = _calculate(_numberOfUpdate[4], 1);
      });
    });
    SharedPrefsRepo.readUpdateClick('1').then((value) {
      if (value == null) return;
      setState(() {
        _numberOfUpdate[0] = value;
        _costUpdate[0] = _calculate(_numberOfUpdate[0], 1);
      });
    });
    super.initState();
  }

  double _calculate(int value, int number) {
    num power = pow(12, number);
    return (power + power * pow(1.07, value)).toDouble();
  }

  void _addClick(int number) {
    if (_numberOfClicks >=
        _calculate((_numberOfUpdate[number]).round(), number)) {
      setState(() {
        _numberOfClicks -=
            _calculate((_numberOfUpdate[number]).round(), number);
        SharedPrefsRepo.writeClick(_numberOfClicks);
        _clickPower++;
        SharedPrefsRepo.writePowerClick(_clickPower);
        _numberOfUpdate[number]++;
        SharedPrefsRepo.writeUpdateClick(
            _numberOfUpdate[number], number.toString());
        _costUpdate[number] = _calculate(_numberOfUpdate[number], number);
      });
    }
  }

  void _addClick1() {
    int number = 1;
    _addClick(number);
  }

  void _addClick2() {
    int number = 2;
    _addClick(number);
  }

  void _addClick3() {
    int number = 3;
    _addClick(number);
  }

  void _addClick4() {
    int number = 4;
    _addClick(number);
  }

  void _addClick5() {
    int number = 5;
    _addClick(number);
  }

  void _addClick6() {
    int number = 6;
    _addClick(number);
  }

  void _addClick7() {
    int number = 7;
    _addClick(number);
  }

  int a = 1;

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
          titleText: _numberOfUpdate[1],
          costText: _costUpdate[1].round(),
          onTap: _addClick1,
          iconImage: "assets/gameimage/icons/first.png",
          numberOfUpdate: "1",
        ),
        ActiveUpdateWidget(
          titleText: _numberOfUpdate[2],
          costText: _costUpdate[2].round(),
          onTap: _addClick2,
          iconImage: "assets/gameimage/icons/second.png",
          numberOfUpdate: "2",
        ),
        ActiveUpdateWidget(
          titleText: _numberOfUpdate[3],
          costText: _costUpdate[3].round(),
          onTap: _addClick3,
          iconImage: "assets/gameimage/icons/third.png",
          numberOfUpdate: "3",
        ),
        ActiveUpdateWidget(
          titleText: _numberOfUpdate[4],
          costText: _costUpdate[4].round(),
          onTap: _addClick4,
          iconImage: "assets/gameimage/icons/fourth.png",
          numberOfUpdate: "4",
        ),
        ActiveUpdateWidget(
          titleText: _numberOfUpdate[5],
          costText: _costUpdate[5].round(),
          onTap: _addClick5,
          iconImage: "assets/gameimage/icons/fifth.png",
          numberOfUpdate: "5",
        ),
        ActiveUpdateWidget(
          titleText: _numberOfUpdate[6],
          costText: _costUpdate[6].round(),
          onTap: _addClick6,
          iconImage: "assets/gameimage/icons/sixth.png",
          numberOfUpdate: "6",
        ),
        ActiveUpdateWidget(
          titleText: _numberOfUpdate[7],
          costText: _costUpdate[7].round(),
          onTap: _addClick7,
          iconImage: "assets/gameimage/icons/seventh.png",
          numberOfUpdate: "7",
        ),
        // ActiveUpdateWidget(
        //   titleText: _numberOfUpdate,
        //   costText: _costUpdate.round(),
        //   onTap: _addClick1,
        //   iconImage: "assets/gameimage/icons/eighth.png",
        //   numberOfUpdate: "8",
        // ),
        // ActiveUpdateWidget(
        //   titleText: _numberOfUpdate,
        //   costText: _costUpdate.round(),
        //   onTap: _addClick1,
        //   iconImage: "assets/gameimage/icons/ninth.png",
        //   numberOfUpdate: "9",
        // ),
        // ActiveUpdateWidget(
        //   titleText: _numberOfUpdate,
        //   costText: _costUpdate.round(),
        //   onTap: _addClick1,
        //   iconImage: "assets/gameimage/icons/tenth.png",
        //   numberOfUpdate: "10",
        // ),
        // ActiveUpdateWidget(
        //   titleText: _numberOfUpdate,
        //   costText: _costUpdate.round(),
        //   onTap: _addClick1,
        //   iconImage: "assets/gameimage/icons/eleventh.png",
        //   numberOfUpdate: "11",
        // ),
      ],
    );
    ;
  }
}
