import 'package:flutter/material.dart';
import 'package:cafebooking/constants/app_colors.dart';
import 'package:cafebooking/screens/dashboard/add_items/add_items_page.dart';
import 'package:cafebooking/screens/dashboard/dashboard_pages.dart';
import 'package:cafebooking/screens/dashboard/od_management/admin_orders_page.dart';
import 'package:cafebooking/screens/loginpage/login.dart';
import 'package:cafebooking/services/auth_service.dart'; // ✅ import AuthService

class AppDrawer extends StatelessWidget {
  final String? profileImage;

  const AppDrawer({super.key, this.profileImage});

  /// Confirm logout dialog
  Future<bool?> _confirmLogout(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure you want to log out?"),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.badgeText,
              foregroundColor: AppColors.textWhite,
            ),
            onPressed: () => Navigator.pop(context, false),
            child: const Text("No"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.logoutColor,
              foregroundColor: AppColors.textWhite,
            ),
            onPressed: () => Navigator.pop(context, true),
            child: const Text("Yes"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, String>>(
      future: AuthService.getAdminInfo(), // ✅ fetch saved admin info
      builder: (context, snapshot) {
        final name = snapshot.data?['name'] ?? "Cafe User";
        final email = snapshot.data?['email'] ?? "user@cafe.com";
        final role = snapshot.data?['role'] ?? "customer";

        return Drawer(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                // ✅ Profile Header
                UserAccountsDrawerHeader(
                  accountName: Text(name),
                  accountEmail: Text(email),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: AppColors.primary,
                    backgroundImage: profileImage != null
                        ? AssetImage(profileImage!)
                        : null,
                    child: profileImage == null
                        ? const Icon(Icons.coffee, color: AppColors.textWhite)
                        : null,
                  ),
                  decoration: const BoxDecoration(color: AppColors.secondary),
                ),

                // ✅ Menu Items
                ListTile(
                  leading: const Icon(Icons.dashboard),
                  title: const Text("Dashboard"),
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const DashboardPage(),
                      ),
                      (route) => false,
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.add),
                  title: const Text("Add Items"),
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const AddItemsPage()),
                      (route) => false,
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.receipt_long),
                  title: const Text("Orders"),
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AdminOrdersPage(),
                      ),
                      (route) => false,
                    );
                  },
                ),

                const Spacer(),
                const Divider(),

                // ✅ Logout with confirmation
                ListTile(
                  leading: const Icon(
                    Icons.logout,
                    color: AppColors.logoutColor,
                  ),
                  title: const Text(
                    "Sign Out",
                    style: TextStyle(color: AppColors.logoutColor),
                  ),
                  onTap: () async {
                    final shouldLogout = await _confirmLogout(context);
                    if (shouldLogout == true) {
                      await AuthService.logout(); // ✅ clear login session
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const CafeLoginPage(),
                        ),
                        (route) => false,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
