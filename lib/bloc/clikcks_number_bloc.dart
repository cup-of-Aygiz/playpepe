import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_of_pepe/bloc/clicks_number_state.dart';
import 'package:game_of_pepe/bloc/updates_bloc.dart';
import 'package:game_of_pepe/repository/shared_prefs_repo.dart';

class ClicksNumberCubit extends Cubit<ClicksNumberState> {
  late final UpdatesCubit updatesCubit;
  DateTime date = new DateTime.now();

  ClicksNumberCubit(UpdatesCubit u)
      : super(ClicksNumberState(
          numberOfClicks: 0,
        )) {
    updatesCubit = u;
    SharedPrefsRepo.readClick().then((value) {
      if (value == null) return;
      emit(ClicksNumberState(
        numberOfClicks: value,
      ));
    });
    print(date);
  }

  List<int> get _numberOfUpdate => updatesCubit.state.numberOfUpdate;

  int _calculate(int value, int number) {
    num power = pow(12, number);
    return (power + power * pow(1.07, value)).toInt();
  }

  late int _clickPower;
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
    int cal = _calculate((_numberOfUpdate[number]).round(), number).toInt();
    if (state.numberOfClicks >= cal) {
      int click = (state.numberOfClicks - cal);
      // _clickPower += pow(10, number).toInt();
      // SharedPrefsRepo.writePowerClick(_clickPower);
      updatesCubit.onUpdate(number);
      _costUpdate[number] = _calculate(_numberOfUpdate[number], number);
      emit(ClicksNumberState(
        numberOfClicks: click,
      ));
    }
  }
}
