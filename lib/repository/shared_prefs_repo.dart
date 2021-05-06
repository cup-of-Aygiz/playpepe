import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsRepo {
  static const String _damageKey = "_damageKey";
  static Future<double?> readClick() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_damageKey);
  }
  static Future<void> writeClick(double damage) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_damageKey, damage);
  }
}

