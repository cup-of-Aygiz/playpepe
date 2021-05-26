import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_of_pepe/bloc/updates_state.dart';
import 'package:game_of_pepe/repository/shared_prefs_repo.dart';

class UpdatesCubit extends Cubit<UpdatesState> {
  DateTime date = new DateTime.now();

  UpdatesCubit()
      : super(UpdatesState(
          numberOfUpdate: [0, 0, 0, 0, 0, 0, 0, 0, 0],
          numberOfCost: [12, 24, 36, 48, 60, 100, 500, 1000, 1621610],
        )) {
    //print("UpdatesCubit $date");
    _initCookie();
  }

  void _initCookie() async {
    List<int> _newList = List.from(state.numberOfUpdate);
    List<int> _newListCost = List.from(state.numberOfCost);
    for (int i = 0; i < state.numberOfUpdate.length; i++) {
      var updateClick = await SharedPrefsRepo.readUpdateClick(i.toString());
      print("я вызвал функцию readUpdateClick с параметрами: $i, резульат: ${updateClick}");
      if (updateClick != null) {
        _newList[i] = updateClick;
      }
      var costClick = await SharedPrefsRepo.readCostNumber(i.toString());
      print("я вызвал функцию readCostNumber с параметрами: $i, резульат: ${costClick}");
      if (costClick != null) {
        _newListCost[i] = costClick;
      }
    }
    emit(UpdatesState(
      numberOfUpdate: _newList,
      numberOfCost: _newListCost,
    ));
  }

  int _calculate(int value, int number) {
    int power = pow(12, number).toInt();
    return (power + power * pow(1.07, value)).toInt();
  }

  void onUpdate(int number) {
    List<int> _newList = List.from(state.numberOfUpdate);
    _newList[number]++;
    List<int> _newListCost = List.from(state.numberOfCost);
    _newListCost[number] = _calculate(_newList[number], number);
    emit(UpdatesState(
      numberOfUpdate: _newList,
      numberOfCost: _newListCost,
    ));
    SharedPrefsRepo.writeUpdateClick(_newList[number], number.toString());
    print("я вызвал функцию writeUpdateClick с параметрами: $number, резульат: ${_newList}");
    SharedPrefsRepo.writeCostNumber(_newListCost[number], number.toString());
    print("я вызвал функцию writeCostNumber с параметрами: $number, резульат: ${_newListCost}");
  }
}
