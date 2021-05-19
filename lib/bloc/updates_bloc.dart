import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_of_pepe/bloc/updates_state.dart';
import 'package:game_of_pepe/repository/shared_prefs_repo.dart';

class UpdatesCubit extends Cubit<UpdatesState> {
  DateTime date = new DateTime.now();
  UpdatesCubit()
      : super(UpdatesState(
          numberOfUpdate: [0, 0, 0, 0, 0, 0, 0, 0, 0],
        )) {
    print("UpdatesCubit $date");

    for (int i = 0; i < state.numberOfUpdate.length; i++) {
      SharedPrefsRepo.readUpdateClick(i.toString()).then((value) {
        if (value == null) return;
        List<int> newList = List.from(state.numberOfUpdate);
        newList[i] = value;
        emit(UpdatesState(
          numberOfUpdate: newList,
        ));
      });
    }
  }

  void onUpdate(int number) {
    print("UpdatesCubit onUpdate $date");
    List<int> newList = List.from(state.numberOfUpdate);
    newList[number]++;
    print(newList);
    emit(UpdatesState(
      numberOfUpdate: newList,
    ));
    SharedPrefsRepo.writeUpdateClick(newList[number], number.toString());
  }
}
