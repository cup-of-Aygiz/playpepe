import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_of_pepe/bloc/power_click_state.dart';
import 'package:game_of_pepe/repository/shared_prefs_repo.dart';

class PowerClickCubit extends Cubit<PowerClickState> {
  PowerClickCubit()
      : super(PowerClickState(
          powerState: 0,
        )) {
    SharedPrefsRepo.readClick().then((value) {
      if (value == null) return;
      emit(PowerClickState(
        powerState: value,
      ));
    });
  }
}
