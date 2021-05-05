import 'package:flutter/cupertino.dart';
import 'package:game_of_pepe/ui/config.dart';

class UpdetPage extends StatefulWidget {
  @override
  _UpdetPageState createState() => _UpdetPageState();
}

class _UpdetPageState extends State<UpdetPage> {
  TextStyle _styleText = AppText.textStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: MediaQuery.of(context).padding.top,),
        Center(
          child: Text(
            "111",
            style: _styleText,
          ),
        ),
        Center(
          child: Text(
            "141",
            style: _styleText,
          ),
        ),
        Center(
          child: Text(
            "121",
            style: _styleText,
          ),
        ),
        Center(
          child: Text(
            "131",
            style: _styleText,
          ),
        ),
      ],
    );
  }
}
