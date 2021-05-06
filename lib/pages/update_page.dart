import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  double _numberOfClicks = 0;
  void initState() {
    SharedPrefsRepo.readClick().then((value) {
      if (value == null) return;
      setState(() {
        _numberOfClicks = value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text("Update bro",style: _styleText,),
          actions: [
            Text("Кол-во: $_numberOfClicks",style: _styleText,),
          ],
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(text: "active",),
              Tab(text: "passive",),
            ],
          ),
        ),
        body: TabBarView(children: [
          ActivePage(),
          PassivePage(),
        ],),
      ),
    );
  }
}
