import 'package:shared_preferences/shared_preferences.dart';

class Cache {
  static SharedPreferences? _prefs;
  static Cache? _instance;

  static Future<Cache> getInstance() async {
    Cache._prefs ??= await SharedPreferences.getInstance();
    Cache._instance ??= Cache();

    return Cache._instance!;
  }

  void setString(String key, String value) {
    Cache._prefs!.setString(key, value);
  }

  Future<String?> getString(String key) async {
    return Cache._prefs!.getString(key);
  }
}