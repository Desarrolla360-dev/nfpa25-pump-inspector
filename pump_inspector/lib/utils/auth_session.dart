import 'package:shared_preferences/shared_preferences.dart';

import 'auth_config.dart';

/// Tracks whether the user is logged in, persisted locally so the app
/// doesn't ask for the password again every time it's reopened.
class AuthSession {
  AuthSession._();

  static const _loggedInKey = 'auth_logged_in';

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_loggedInKey) ?? false;
  }

  /// Returns true and persists the session if the credentials match.
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
