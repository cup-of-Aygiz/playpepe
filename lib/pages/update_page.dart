import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_of_pepe/bloc/clikcks_number_bloc.dart';
import 'package:game_of_pepe/bloc/clicks_number_state.dart';
import 'package:game_of_pepe/pages/update_active_page.dart';
import 'package:game_of_pepe/pages/update_passive_page.dart';
import 'package:game_of_pepe/ui/config.dart';

class UpdatePage extends StatefulWidget {
  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  TextStyle _styleText = AppText.textStyle;
  Decoration _dec = Decorations.boxDecoration1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClicksNumberCubit, ClicksNumberState>(
      builder: (context, ClicksNumberState state) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: _dec,
            ),
            backgroundColor: Colors.transparent,
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
