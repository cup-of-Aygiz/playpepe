import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_of_pepe/bloc/updates_state.dart';
import 'package:game_of_pepe/repository/shared_prefs_repo.dart';

class UpdatesCubit extends Cubit<UpdatesState> {
  UpdatesCubit()
      : super(UpdatesState(
          numberOfClicks: 0,
        )) {
    SharedPrefsRepo.readClick().then((value) {
      if (value == null) return;
      emit(UpdatesState(
        numberOfClicks: value,
      ));
    });
  }

  void onClick(double clickPower) {
    double click = state.numberOfClicks + clickPower;
    emit(UpdatesState(
      numberOfClicks: click,
    ));
    SharedPrefsRepo.writeClick(click);
  }
}
