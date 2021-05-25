import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsRepo {
  static const String _clickKey = "_ClickKey";
  static const String _powerClick = "_PowerClickKey";
  static const String _numberOfActiveUpdate = "_numberOfActiveUpdate";
  static const String _costToUpdate = "_numberOfActiveUpdate";

  static Future<int?> readClick() async {
    //кол-во кликов
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_clickKey);
  }

  static Future<void> writeClick(int damage) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_clickKey, damage);
  }

  static Future<int?> readPowerClick() async {
    //сила клика
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_powerClick);
  }

//String number
  static Future<void> writePowerClick(int power) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_powerClick, power);
  }

  static Future<int?> readUpdateClick(String number) async {
    //кол-во обдейтов
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("$_numberOfActiveUpdate$number");
  }

  static Future<void> writeUpdateClick(int update, String number) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("$_numberOfActiveUpdate$number", update);
  }

  static Future<int?> readCostNumber(String number) async {
    //стоимость улчушения
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("$_costToUpdate$number");
  }

  static Future<void> writeCostNumber(int cost, String number) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("$_costToUpdate$number", cost);
  }
}
