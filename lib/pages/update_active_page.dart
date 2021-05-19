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
    super.initState();
  }

  int _calculate(int value, int number) {
    num power = pow(12, number);
    return (power + power * pow(1.07, value)).toInt();
  }

  void _addClick(int number) {
    BlocProvider.of<ClicksNumberCubit>(context).addClick(number);
    //BlocProvider.of<UpdatesCubit>(context).onUpdate(number);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClicksNumberCubit, ClicksNumberState>(
      builder: (context, ClicksNumberState state) =>
          BlocBuilder<UpdatesCubit, UpdatesState>(
              builder: (context, UpdatesState updateState) {
        print("1@1 ${updateState.numberOfUpdate}");
        //print(updateState);
        return GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: [1, 2, 3, 4, 5, 6, 7]
              .map(
                (i) => ActiveUpdateWidget(
                  key: Key(
                      "AUW_${updateState.numberOfUpdate[i]}_${_costUpdate[i]}"),
                  titleText: updateState.numberOfUpdate[i],
                  costText: _costUpdate[i].round(),
                  onTap: () {
                    _addClick(i);
                  },
                  iconImage: "assets/gameimage/icons/act_update_$i.png",
                  numberOfUpdate: "$i",
                ),
              )
              .toList(),
          // children: <Widget>[
          //   for (int i = 1; i < 8; i++)
          //     ActiveUpdateWidget(
          //       titleText: updateState.numberOfUpdate[i],
          //       costText: _costUpdate[i].round(),
          //       onTap: () {
          //         _addClick(i);
          //       },
          //       iconImage: "assets/gameimage/icons/act_update_$i.png",
          //       numberOfUpdate: "$i",
          //     ),
          //   Container(color: Colors.red,)
          // ],
        );
      }),
    );
    ;
  }
}
