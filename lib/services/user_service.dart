import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cafebooking/models/profile_model.dart';

class UserService {
  static Future<String> getUserName() async {
    String name = '';

 
    try {
      if (Hive.isBoxOpen('profileBox')) {
        final box = Hive.box<Profile>('profileBox');
        if (box.isNotEmpty) {
          final p = box.values.first;
          final dyn = p as dynamic;
          final n = dyn.name;
          if (n is String && n.isNotEmpty) {
            return n;
          }
        }
      }
    } catch (_) {}

    try {
      if (Hive.isBoxOpen('userBox')) {
        final u = Hive.box('userBox');
        final n = u.get('name') ?? '';
        if (n is String && n.isNotEmpty) {
          return n;
        }
      }
    } catch (_) {}


    try {
      final sp = await SharedPreferences.getInstance();
      final n = sp.getString('name') ?? '';
      if (n.isNotEmpty) {
        return n;
      }
    } catch (_) {}

    return name;
  }
}
