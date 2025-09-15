import 'package:hive_flutter/hive_flutter.dart';
import 'package:cafebooking/models/profile_model.dart';

class ProfileService {
  static const String profileBoxName = 'profileBox';


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
    return null; 
  }

  
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
