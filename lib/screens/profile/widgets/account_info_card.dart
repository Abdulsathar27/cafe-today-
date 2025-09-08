import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cafebooking/constants/app_colors.dart';
import 'package:cafebooking/models/profile_model.dart';

class AccountInfoCard extends StatefulWidget {
  const AccountInfoCard({super.key});

  @override
  State<AccountInfoCard> createState() => _AccountInfoCardState();
}

class _AccountInfoCardState extends State<AccountInfoCard> {
  static const String profileBoxName = 'profileBox';
  static const String primitiveBoxName = 'userBox';
  static const String spNameKey = 'name';
  static const String spEmailKey = 'email';
  static const String spPhoneKey = 'phone';

  Future<Profile?> _readProfile() async {
    try {
      if (Hive.isBoxOpen(profileBoxName)) {
        final box = Hive.box<Profile>(profileBoxName);
        if (box.isNotEmpty) return box.values.first;
      }
    } catch (_) {}
    return null;
  }

  Future<Map<String, String>> _readPrimitiveUser() async {
    try {
      if (Hive.isBoxOpen(primitiveBoxName)) {
        final box = Hive.box(primitiveBoxName);
        final name = box.get('name') ?? '';
        final email = box.get('email') ?? '';
        final phone = box.get('phone') ?? '';
        return {
          'name': name.toString(),
          'email': email.toString(),
          'phone': phone.toString()
        };
      }
    } catch (_) {}
    return {'name': '', 'email': '', 'phone': ''};
  }

  Future<Map<String, String>> _readSharedPreferencesUser() async {
    try {
      final sp = await SharedPreferences.getInstance();
      final name = sp.getString(spNameKey) ?? '';
      final email = sp.getString(spEmailKey) ?? '';
      final phone = sp.getString(spPhoneKey) ?? '';
      return {'name': name, 'email': email, 'phone': phone};
    } catch (_) {}
    return {'name': '', 'email': '', 'phone': ''};
  }

  Future<Map<String, String>> _readCombinedUser() async {
    
    final profile = await _readProfile();
    if (profile != null) {
      return {
        'name': profile.name,
        'email': profile.email,
        'phone': profile.phone
      };
    }

    final prim = await _readPrimitiveUser();
    if ((prim['name'] ?? '').isNotEmpty) {
      return prim;
    }

    final sp = await _readSharedPreferencesUser();
    if ((sp['name'] ?? '').isNotEmpty) {
      return sp;
    }

    return {'name': '', 'email': '', 'phone': ''};
  }

  Future<void> _saveUser({
    required String name,
    required String email,
    required String phone,
  }) async {
    
    try {
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
    } catch (_) {
      
    }

   
    try {
      if (Hive.isBoxOpen(primitiveBoxName)) {
        final box = Hive.box(primitiveBoxName);
        await box.put('name', name);
        await box.put('email', email);
        await box.put('phone', phone);
        return;
      }
    } catch (_) {
      
    }

    
    try {
      final sp = await SharedPreferences.getInstance();
      await sp.setString(spNameKey, name);
      await sp.setString(spEmailKey, email);
      await sp.setString(spPhoneKey, phone);
    } catch (_) {
      
    }
  }

  Future<void> _showEditDialog(BuildContext ctx, Map<String, String> current) async {
    final nameCtrl = TextEditingController(text: current['name'] ?? '');
    final emailCtrl = TextEditingController(text: current['email'] ?? '');
    final phoneCtrl = TextEditingController(text: current['phone'] ?? '');

    await showDialog(
      context: ctx,
      builder: (dCtx) {
        return AlertDialog(
          title: const Text('Edit Profile'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameCtrl,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: emailCtrl,
                  decoration: const InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: phoneCtrl,
                  decoration: const InputDecoration(labelText: 'Phone'),
                  keyboardType: TextInputType.phone,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(dCtx), child: const Text('Cancel',
            style: TextStyle(color: AppColors.textPrimary),
            )),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
              onPressed: () async {
                final newName = nameCtrl.text.trim();
                final newEmail = emailCtrl.text.trim();
                final newPhone = phoneCtrl.text.trim();

                if (newName.isEmpty) {
                  ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
                backgroundColor: AppColors.buttonPrimary,
                behavior: SnackBarBehavior.floating,
                margin: const EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                ),
                    content: const Text('Name cannot be empty'),
                  ));
                  return;
                }

                await _saveUser(name: newName, email: newEmail, phone: newPhone);
                Navigator.pop(dCtx);
                setState(() {}); 
                ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
                backgroundColor: AppColors.buttonPrimary,
                behavior: SnackBarBehavior.floating,
                margin: const EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                ),
                  content: const Text('Profile updated'),
                ));
              },
              child: const Text('Save'
              ,style: TextStyle(color: AppColors.textPrimary),),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, String>>(
      future: _readCombinedUser(),
      builder: (context, snap) {
        final data = (snap.hasData) ? snap.data! : {'name': '', 'email': '', 'phone': ''};
        final String name = (data['name'] ?? '').isNotEmpty ? data['name']! : 'Guest';
        final String email = (data['email'] ?? '').isNotEmpty ? data['email']! : '—';
        final String phone = (data['phone'] ?? '').isNotEmpty ? data['phone']! : '—';

        return Card(
          color: AppColors.badgeBg,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Account Info', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Row(children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: AppColors.secondary,
                  child: Text((name.isNotEmpty && name != 'Guest') ? name[0].toUpperCase() : 'G', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(email, style: const TextStyle(color: Colors.grey)),
                    const SizedBox(height: 2),
                    Text(phone, style: const TextStyle(color: Colors.grey)),
                  ]),
                ),
                IconButton(
                  icon: const Icon(Icons.edit, color: AppColors.textPrimary),
                  onPressed: () => _showEditDialog(context, data),
                ),
              ]),
            ]),
          ),
        );
      },
    );
  }
}
