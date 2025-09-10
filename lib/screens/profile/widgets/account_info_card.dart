import 'package:flutter/material.dart';
import 'package:cafebooking/constants/app_colors.dart';
import 'package:cafebooking/services/profile_service.dart';

class AccountInfoCard extends StatefulWidget {
  const AccountInfoCard({super.key});

  @override
  State<AccountInfoCard> createState() => _AccountInfoCardState();
}

class _AccountInfoCardState extends State<AccountInfoCard> {
  Future<void> _showEditDialog(
    BuildContext ctx,
    Map<String, String> current,
  ) async {
    final nameCtrl = TextEditingController(text: current['name'] ?? '');
    final emailCtrl = TextEditingController(text: current['email'] ?? '');
    final phoneCtrl = TextEditingController(text: current['phone'] ?? '');

    await showDialog(
      context: ctx,
      builder: (dCtx) {
        return AlertDialog(
          title: const Text('Edit Profile'),
          content: Column(
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
              ),
              const SizedBox(height: 8),
              TextField(
                controller: phoneCtrl,
                decoration: const InputDecoration(labelText: 'Phone'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.logoutColor,
                foregroundColor: AppColors.textWhite
              ),
              
              onPressed: () => Navigator.pop(dCtx),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.badgeText,
              foregroundColor: AppColors.textWhite,
            ),
              onPressed: () async {
                final newName = nameCtrl.text.trim();
                final newEmail = emailCtrl.text.trim();
                final newPhone = phoneCtrl.text.trim();

                if (newName.isEmpty) {
                  ScaffoldMessenger.of(ctx).showSnackBar(
                    const SnackBar(content: Text('Name cannot be empty')),
                  );
                  return;
                }

                await ProfileService.saveUser(
                  name: newName,
                  email: newEmail,
                  phone: newPhone,
                );

                if (mounted) setState(() {});
                Navigator.pop(dCtx);
                ScaffoldMessenger.of(ctx).showSnackBar(
                  SnackBar(
                    backgroundColor: AppColors.buttonPrimary,
                    behavior: SnackBarBehavior.floating,
                    margin: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    content: const Text('Profile updated'),
                  ),
                );
              },
              child: const Text('Save',),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, String>>(
      future: ProfileService.readCombinedUser(),
      builder: (context, snap) {
        final data = snap.data ?? {'name': '', 'email': '', 'phone': ''};
        final name = data['name']!.isNotEmpty ? data['name']! : 'Guest';
        final email = data['email']!.isNotEmpty ? data['email']! : '—';
        final phone = data['phone']!.isNotEmpty ? data['phone']! : '—';

        return Card(
          color: AppColors.badgeBg,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Account Info',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: AppColors.secondary,
                      child: Text(
                        (name != 'Guest') ? name[0].toUpperCase() : 'G',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            email,
                            style: const TextStyle(color:AppColors.inputHint),
                          ),
                          Text(
                            phone,
                            style: const TextStyle(color: AppColors.inputHint),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.edit,
                        color: AppColors.textPrimary,
                      ),
                      onPressed: () => _showEditDialog(context, data),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
