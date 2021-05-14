import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_of_pepe/bloc/clikcks_number_bloc.dart';
import 'package:game_of_pepe/bloc/updates_bloc.dart';
import 'package:game_of_pepe/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var updatesCubit = UpdatesCubit();
    return MultiBlocProvider(
      providers: [
        BlocProvider<ClicksNumberCubit>(
          create: (c) => ClicksNumberCubit(updatesCubit),
        ),
        BlocProvider<UpdatesCubit>(
          create: (c) => updatesCubit,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
