

import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static Future<SharedPreferences>? _prefs = SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  static bool _initCalled = false;

  static Future<void> init() async {
    _initCalled = true;
    _prefsInstance = await _prefs;
  }

  static void dispose() {
    _prefs = null;
    _prefsInstance = null;
  }

  static int getInt(String key, int value) {
    return _prefsInstance!.getInt(key) ?? value;
  }

  static setInt(String key, int value) {
    _prefsInstance!.setInt(key, value);
  }

  static setString(String key, String? value) async {
    _prefsInstance!.setString(key, value!);
  }

  static String getString(String key, String? value) {
    return _prefsInstance!.getString(key) ?? value ?? "";
  }

  static Future<bool> setBool(String key, bool value) async {
    return _prefsInstance!.setBool(key, value);
  }

  static bool getBool(String key, bool value) {
    return _prefsInstance!.getBool(key) ?? value;
  }

  static setDouble(String key, double value) async {
    _prefsInstance!.setDouble(key, value);
  }

  static double getDouble(String key, double value) {
    return _prefsInstance!.getDouble(key) ?? value;
  }

  static Future<bool> remove(String key) async {
    return _prefsInstance!.remove(key);
  }

  static clear() async {
    _prefsInstance!.clear();
  }
}
