import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static SharedPreferences? _sharedPrefs;

  init() async {
    if (_sharedPrefs == null) {
      _sharedPrefs = await SharedPreferences.getInstance();
    }
  }

  Future<bool> setBool(String key, bool value) async {
    return _sharedPrefs!.setBool(key, value);
  }
  bool getBool(String key) {
    return _sharedPrefs!.getBool(key) ?? false;
  }

  int getInt(String key) {
    return _sharedPrefs!.getInt(key) ?? 0;
  }

  Future<bool> setInt(String key, int value) async {
    return _sharedPrefs!.setInt(key, value);
  }

  String getString(String key) {
    return _sharedPrefs!.getString(key) ?? '';
  }

  Future<bool> setString(String key, String value) async {
    return _sharedPrefs!.setString(key, value);
  }

  double getDouble(String key) {
    return _sharedPrefs!.getDouble(key) ?? 0.0;
  }

  Future<bool> setDouble(String key, double value) async {
    return _sharedPrefs!.setDouble(key, value);
  }

  clear(){
    _sharedPrefs!.clear();
  }

Future<bool> hasKey( String key) async {
    return _sharedPrefs!.containsKey(key);
  }

  remove(String key) async {
    await _sharedPrefs!.remove(key);
  }
}

final sharedPrefs = SharedPreferenceHelper();
