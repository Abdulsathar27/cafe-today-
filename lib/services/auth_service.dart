import 'package:shared_preferences/shared_preferences.dart';

class AuthService {

  static const _keyIsLoggedIn = 'is_logged_in';
  static const _keyRole = 'role'; 

  
  static Future<bool> register(
      String username, String password, String email, String role) async {
    final prefs = await SharedPreferences.getInstance();

 
    await prefs.setString('${role}_username', username);
    await prefs.setString('${role}_password', password);
    await prefs.setString('${role}_email', email);

    return true;
  }

  
  static Future<bool> login(
      String username, String password, String role) async {
    final prefs = await SharedPreferences.getInstance();

    final savedUser = prefs.getString('${role}_username');
    final savedPass = prefs.getString('${role}_password');

    if (savedUser == username && savedPass == password) {
      await prefs.setBool(_keyIsLoggedIn, true);
      await prefs.setString(_keyRole, role); 
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
    await prefs.remove(_keyRole); // remove stored role
  }


  static Future<Map<String, String>> getAdminInfo() async {
    final prefs = await SharedPreferences.getInstance();

    final username = prefs.getString('admin_username') ?? "Cafe Admin";
    final email = prefs.getString('admin_email') ?? "admin@cafe.com";

    return {
      "name": username,
      "email": email,
      "role": "admin",
    };
  }

  static Future<String?> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    final role = prefs.getString(_keyRole);
    if (role == null) return null;
    return prefs.getString('${role}_username');
  }

  static Future<String?> getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    final role = prefs.getString(_keyRole);
    if (role == null) return null;
    return prefs.getString('${role}_email');
  }

  static Future<String?> getRole() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyRole);
  }
}
