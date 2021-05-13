import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_of_pepe/bloc/updates_bloc.dart';
import 'package:game_of_pepe/bloc/updates_state.dart';
import 'package:game_of_pepe/pages/update_active_page.dart';
import 'package:game_of_pepe/pages/update_passive_page.dart';
import 'package:game_of_pepe/repository/shared_prefs_repo.dart';
import 'package:game_of_pepe/ui/config.dart';

class UpdatePage extends StatefulWidget {
  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  TextStyle _styleText = AppText.textStyle;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdatesCubit,UpdatesState>(
      builder: (context, UpdatesState state) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            title: Text(
              "Update bro",
              style: _styleText,
            ),
            actions: [
              Text(
                "Кол-во: ${state.numberOfClicks}",
                style: _styleText,
              ),
            ],
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(
                  text: "active",
                ),
                Tab(
                  text: "passive",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ActivePage(),
              PassivePage(),
            ],
          ),
        ),
      ),
    );
  }
}
