import 'package:shared_preferences/shared_preferences.dart';
class AuthService {
  static const _keyUsername = 'username';
  static const _keyPassword = 'password';
  static const _keyIsLoggedIn = 'is_logged_in';

 
  static Future<bool> register(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();

    
    await prefs.setString(_keyUsername, username);
    await prefs.setString(_keyPassword, password);
    return true;
  }

 
  static Future<bool> login(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();

    final savedUser = prefs.getString(_keyUsername);
    final savedPass = prefs.getString(_keyPassword);

    if (savedUser == username && savedPass == password) {
      await prefs.setBool(_keyIsLoggedIn, true);
      return true;
    }
    return false;
  }

  
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyIsLoggedIn) ?? false;
  }

  
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyIsLoggedIn, false);
  }
}
