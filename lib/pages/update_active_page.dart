import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_of_pepe/bloc/clicks_number_state.dart';
import 'package:game_of_pepe/bloc/clikcks_number_bloc.dart';
import 'package:game_of_pepe/bloc/cost_bloc.dart';
import 'package:game_of_pepe/bloc/cost_state.dart';
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
  static const Duration _animationDuration = AppAnimation.animationDuration;
  static const TextStyle _styleText = AppText.textStyleToUpdate;

  void initState() {
    super.initState();
  }

  void _addClick(int number) {
    BlocProvider.of<ClicksNumberCubit>(context).addClick(number);
    //BlocProvider.of<UpdatesCubit>(context).onUpdate(number);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CostCubit, CostState>(
        builder: (context, CostState costState) =>
            BlocBuilder<ClicksNumberCubit, ClicksNumberState>(
                builder: (context, ClicksNumberState state) =>
                    BlocBuilder<UpdatesCubit, UpdatesState>(
                      builder: (context, UpdatesState updateState) {
                        //print("1@1 ${updateState.numberOfUpdate}");
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
                                      "AUW_${updateState.numberOfUpdate[i]}_${costState.numberOfCost[i].round()}"),
                                  titleText: updateState.numberOfUpdate[i],
                                  costText: costState.numberOfCost[i].round(),
                                  onTap: () {
                                    _addClick(i);
                                  },
                                  iconImage:
                                      "assets/gameimage/icons/act_update_$i.png",
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
                      },
                    )));
  }
}
