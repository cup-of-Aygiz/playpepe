import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_of_pepe/bloc/clicks_number_state.dart';
import 'package:game_of_pepe/bloc/updates_bloc.dart';
import 'package:game_of_pepe/repository/shared_prefs_repo.dart';

import 'cost_bloc.dart';

class ClicksNumberCubit extends Cubit<ClicksNumberState> {
  late final UpdatesCubit updatesCubit;
  late final CostCubit costCubit;
  DateTime date = new DateTime.now();

  ClicksNumberCubit(UpdatesCubit update,CostCubit cost)
      : super(ClicksNumberState(
          numberOfClicks: 0,
        )) {
    updatesCubit = update;
    costCubit = cost;
    SharedPrefsRepo.readClick().then((value) {
      if (value == null) return;
      emit(ClicksNumberState(
        numberOfClicks: value,
      ));
    });
    print(date);
  }

  List<int> get _numberOfUpdate => updatesCubit.state.numberOfUpdate;
  List<int> get _costUpdate => costCubit.state.numberOfCost;

  int _calculate(int value, int number) {
    num power = pow(12, number);
    return (power + power * pow(1.07, value)).toInt();
  }

  late int _clickPower = 1;

  void onClick(int clickPower) {
    int click = (state.numberOfClicks + clickPower).toInt();
    emit(ClicksNumberState(
      numberOfClicks: click,
    ));
    SharedPrefsRepo.writeClick(click);
  }

  void addClick(int number) {
    SharedPrefsRepo.readPowerClick().then((value) {
      if (value != null) _clickPower = value;
    });
    if (state.numberOfClicks >= _costUpdate[number]) {
      int click = (state.numberOfClicks - _costUpdate[number]);
      _clickPower += pow(10, number).toInt();
       SharedPrefsRepo.writePowerClick(_clickPower);
       updatesCubit.onUpdate(number);
      _costUpdate[number] = _calculate(_numberOfUpdate[number], number);
      emit(ClicksNumberState(
        numberOfClicks: click,
      ));
    }
  }
}
