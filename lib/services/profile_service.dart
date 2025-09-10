import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cafebooking/models/profile_model.dart';

class ProfileService {
  static const String profileBoxName = 'profileBox';
  static const String primitiveBoxName = 'userBox';
  static const String spNameKey = 'name';
  static const String spEmailKey = 'email';
  static const String spPhoneKey = 'phone';

  /// Reads profile model from Hive (if exists)
  static Future<Profile?> readProfile() async {
    if (Hive.isBoxOpen(profileBoxName)) {
      final box = Hive.box<Profile>(profileBoxName);
      if (box.isNotEmpty) return box.values.first;
    }
    return null;
  }

  /// Reads simple user map from Hive (primitive storage)
  static Future<Map<String, String>> readPrimitiveUser() async {
    if (Hive.isBoxOpen(primitiveBoxName)) {
      final box = Hive.box(primitiveBoxName);
      return {
        'name': (box.get('name') ?? '').toString(),
        'email': (box.get('email') ?? '').toString(),
        'phone': (box.get('phone') ?? '').toString(),
      };
    }
    return {'name': '', 'email': '', 'phone': ''};
  }

  /// Reads user data from SharedPreferences
  static Future<Map<String, String>> readSharedPreferencesUser() async {
    final sp = await SharedPreferences.getInstance();
    return {
      'name': sp.getString(spNameKey) ?? '',
      'email': sp.getString(spEmailKey) ?? '',
      'phone': sp.getString(spPhoneKey) ?? '',
    };
  }

  /// Reads profile in a fallback order: Hive(Profile) → Hive(UserBox) → SP
  static Future<Map<String, String>> readCombinedUser() async {
    final profile = await readProfile();
    if (profile != null) {
      return {'name': profile.name, 'email': profile.email, 'phone': profile.phone};
    }

    final prim = await readPrimitiveUser();
    if ((prim['name'] ?? '').isNotEmpty) return prim;

    return await readSharedPreferencesUser();
  }

  /// Save or update user details (tries Hive first, then Hive(userBox), then SP)
  static Future<void> saveUser({
    required String name,
    required String email,
    required String phone,
  }) async {
    // Hive profileBox
    if (Hive.isBoxOpen(profileBoxName)) {
      final box = Hive.box<Profile>(profileBoxName);
      if (box.isEmpty) {
        final profile = Profile(name: name, email: email, phone: phone, avatarUrl: '');
        await box.add(profile);
        return;
      } else {
        final key = box.keyAt(0);
        final profile = box.get(key);
        if (profile != null) {
          profile.name = name;
          profile.email = email;
          profile.phone = phone;
          await profile.save();
          return;
        }
      }
    }

    // Hive primitiveBox
    if (Hive.isBoxOpen(primitiveBoxName)) {
      final box = Hive.box(primitiveBoxName);
      await box.put('name', name);
      await box.put('email', email);
      await box.put('phone', phone);
      return;
    }

    // SharedPreferences fallback
    final sp = await SharedPreferences.getInstance();
    await sp.setString(spNameKey, name);
    await sp.setString(spEmailKey, email);
    await sp.setString(spPhoneKey, phone);
  }
}
