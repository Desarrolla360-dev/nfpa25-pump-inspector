import 'package:shared_preferences/shared_preferences.dart';

import 'auth_config.dart';
class AuthSession {
  AuthSession._();

  static const _loggedInKey = 'auth_logged_in';

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_loggedInKey) ?? false;
  }

  static Future<bool> login({
    required String username,
    required String password,
  }) async {
    final isValid =
        username == AuthConfig.username && password == AuthConfig.password;
    if (isValid) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_loggedInKey, true);
    }
    return isValid;
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_loggedInKey, false);
  }
}
