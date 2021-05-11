import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsRepo {
  static const String _clickKey = "_ClickKey";
  static const String _powerClick = "_PowerClickKey";
  static const String _numberOfActiveUpdate = "_numberOfActiveUpdate";

  static Future<double?> readClick() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_clickKey);
  }

  static Future<void> writeClick(double damage) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_clickKey, damage);
  }

  static Future<double?> readPowerClick() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_powerClick);
  }

//String number
  static Future<void> writePowerClick(double power) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_powerClick, power);
  }

  static Future<int?> readUpdateClick(String number) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("$_numberOfActiveUpdate$number");
  }

  static Future<void> writeUpdateClick(int update, String number) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("$_numberOfActiveUpdate$number", update);
  }
}
