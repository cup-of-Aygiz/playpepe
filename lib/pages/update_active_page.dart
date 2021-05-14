import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_of_pepe/bloc/clicks_number_state.dart';
import 'package:game_of_pepe/bloc/clikcks_number_bloc.dart';
import 'package:game_of_pepe/bloc/updates_bloc.dart';
import 'package:game_of_pepe/bloc/updates_state.dart';
import 'package:game_of_pepe/repository/shared_prefs_repo.dart';
import 'package:game_of_pepe/ui/config.dart';
import 'package:game_of_pepe/widgets/active_update_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ActivePage extends StatefulWidget {
  @override
  _ActivePageState createState() => _ActivePageState();
}

class _ActivePageState extends State<ActivePage> {
  late int _clickPower = 1;
  late List<int> _numberOfUpdate = [0, 0, 0, 0, 0, 0, 0, 0, 0];
  late List<int> _costUpdate = [
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

  int _calculate(int value, int number) {
    num power = pow(12, number);
    return (power + power * pow(1.07, value)).toInt();
  }

  void _addClick1() {
    BlocProvider.of<ClicksNumberCubit>(context).addClick(1);
    BlocProvider.of<UpdatesCubit>(context);
  }

  void _addClick2() {
    BlocProvider.of<ClicksNumberCubit>(context).addClick(2);
  }

  void _addClick3() {
    BlocProvider.of<ClicksNumberCubit>(context).addClick(3);
  }

  void _addClick4() {
    BlocProvider.of<ClicksNumberCubit>(context).addClick(4);
  }

  void _addClick5() {
    BlocProvider.of<ClicksNumberCubit>(context).addClick(5);
  }

  void _addClick6() {
    BlocProvider.of<ClicksNumberCubit>(context).addClick(6);
  }

  void _addClick7() {
    BlocProvider.of<ClicksNumberCubit>(context).addClick(7);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClicksNumberCubit, ClicksNumberState>(
      builder: (context, ClicksNumberState state) =>
          BlocBuilder<UpdatesCubit, UpdatesState>(
        builder: (context, UpdatesState updateState) => GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            ActiveUpdateWidget(
              titleText: updateState.numberOfUpdate[1],
              costText: _costUpdate[1].round(),
              onTap: _addClick1,
              iconImage: "assets/gameimage/icons/first.png",
              numberOfUpdate: "1",
            ),
            ActiveUpdateWidget(
              titleText: updateState.numberOfUpdate[2],
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
        ),
      ),
    );
    ;
  }
}
