import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_of_pepe/bloc/cost_state.dart';
import 'package:game_of_pepe/repository/shared_prefs_repo.dart';

class CostCubit extends Cubit<CostState> {
  CostCubit()
      : super(CostState(
            numberOfCost: [12, 24, 36, 48, 60, 100, 500, 1000, 1621610])) {
    //print("UpdatesCubit $date");
    for (int i = 0; i < state.numberOfCost.length; i++) {
      SharedPrefsRepo.readCostNumber(i.toString()).then((value) {
        if (value == null) return;
        List<int> newList = List.from(state.numberOfCost);
        newList[i] = value;
        emit(CostState(
          numberOfCost: newList,
        ));
      });
    }
  }

  int _calculate(int value, int number) {
    num power = pow(12, number);
    return (power + power * pow(1.07, value)).toInt();
  }

  void onIncreaseCost(int number) {
    //print("UpdatesCubit onUpdate $date");
    List<int> newList = List.from(state.numberOfCost);
    newList[number] = _calculate(number, number);
    //print(newList);
    emit(CostState(
      numberOfCost: newList,
    ));
    SharedPrefsRepo.writeUpdateClick(newList[number], number.toString());
  }
}
