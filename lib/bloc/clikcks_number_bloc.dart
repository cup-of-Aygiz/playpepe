import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_of_pepe/bloc/clicks_number_state.dart';
import 'package:game_of_pepe/bloc/updates_bloc.dart';
import 'package:game_of_pepe/repository/shared_prefs_repo.dart';

class ClicksNumberCubit extends Cubit<ClicksNumberState> {
  late final UpdatesCubit updatesCubit;
  DateTime date = new DateTime.now();

  ClicksNumberCubit(UpdatesCubit update)
      : super(ClicksNumberState(
          numberOfClicks: 0,
        )) {
    updatesCubit = update;
    SharedPrefsRepo.readClick().then((value) {
      if (value == null) return;
      emit(ClicksNumberState(
        numberOfClicks: value,
      ));
    });
    print(date);
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
    if (state.numberOfClicks >= updatesCubit.state.numberOfCost[number]) {
      int click =
          (state.numberOfClicks - updatesCubit.state.numberOfCost[number]);
      _clickPower += pow(10, number).toInt();
      SharedPrefsRepo.writePowerClick(_clickPower);
      updatesCubit.onUpdate(number);
      //_costUpdate[number] = _calculate(_numberOfUpdate[number], number)
      //print("number of udpaetqwwqtqwfqd${_numberOfUpdate}");
      //print("number of udpaetqwwqtqwfqd${_numberOfUpdate[number]}");
      emit(ClicksNumberState(
        numberOfClicks: click,
      ));
    }
  }
}
