import 'package:shared_preferences/shared_preferences.dart';

class StateNotifier {
  static const String key = "state";
  static late SharedPreferences _preferences;
  var selectedState;

  StateNotifier() {
    init();
  }

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setStateName(String selected) =>
      _preferences.setString(key, selected);

  static String? getStateName() => _preferences.getString(key);
}
