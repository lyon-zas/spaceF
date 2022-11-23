import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static SharedPreferences _preferences =
      SharedPreferences.getInstance() as SharedPreferences;
  static const _keyUsername = "username";
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();
  static Future setUsername(String _userName) async =>
      await _preferences.setString(_keyUsername, _userName);

  static String? getUsername() => _preferences.getString(_keyUsername);
}
