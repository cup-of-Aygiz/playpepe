import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsRepo {
  static const String _ClickKey = "_ClickKey";
  static const String _PowerClick = "_PowerClickKey";
  static const String _numberOfUpdate = "_numberOfUpdate";
  static Future<double?> readClick() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_ClickKey);
  }
  static Future<void> writeClick(double damage) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_ClickKey, damage);
  }

  static Future<double?> readPowerClick() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_PowerClick);
  }

  static Future<void> writePowerClick(double power) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_PowerClick, power);
  }

  static Future<int?> readUpdateClick() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_numberOfUpdate);
  }

  static Future<void> writeUpdateClick(int update) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_numberOfUpdate, update);
  }
}

