import 'package:hive_flutter/hive_flutter.dart';
import 'package:cafebooking/models/profile_model.dart';

class ProfileService {
  static const String profileBoxName = 'profileBox';

  /// Returns profile data as Map, or null if no profile exists
  static Future<Map<String, String>?> readCombinedUser() async {
    if (Hive.isBoxOpen(profileBoxName)) {
      final box = Hive.box<Profile>(profileBoxName);
      if (box.isNotEmpty) {
        final p = box.values.first;
        return {
          'name': p.name,
          'email': p.email,
          'phone': p.phone,
          'role': p.role,
          'password': p.password,
        };
      }
    }
    return null; // 🚨 instead of returning empty strings
  }

  /// Saves or updates the user profile
  static Future<void> saveUser({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String role,
  }) async {
    if (Hive.isBoxOpen(profileBoxName)) {
      final box = Hive.box<Profile>(profileBoxName);
      if (box.isEmpty) {
        // New profile
        final profile = Profile(
          name: name,
          email: email,
          phone: phone,
          avatarUrl: '',
          role: role,
          password: password,
        );
        await box.add(profile);
      } else {
        // Update existing profile
        final key = box.keyAt(0);
        final profile = box.get(key);
        if (profile != null) {
          profile.name = name;
          profile.email = email;
          profile.phone = phone;
          profile.role = role;
          profile.password = password;
          await profile.save();
        }
      }
    }
  }
}
