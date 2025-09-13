import 'package:cafebooking/constants/app_colors.dart';
import 'package:cafebooking/screens/dashboard/add_items/add_items_page.dart';
import 'package:cafebooking/screens/dashboard/dashboard_pages.dart';
import 'package:cafebooking/screens/dashboard/od_management/admin_orders_page.dart';
import 'package:flutter/material.dart';
import 'package:cafebooking/screens/loginpage/login.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
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
            // Header
            UserAccountsDrawerHeader(
              accountName: const Text("Cafe Admin"),
              accountEmail: const Text("admin@cafe.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: AppColors.primary,
                child: const Icon(Icons.coffee, color: AppColors.textWhite),
              ),
              decoration: const BoxDecoration(color: AppColors.secondary),
            ),

            // Menu Items
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text("Dashboard"),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const DashboardPage()), // replace with DashboardPage()
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
                  MaterialPageRoute(builder: (_) => const AddItemsPage()), // replace with AddItemsPage()
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
                  MaterialPageRoute(builder: (_) => const AdminOrdersPage ()), // replace with OrdersPage()
                  (route) => false,
                );
              },
            ),

            const Spacer(),
            const Divider(),

           
            
            ListTile(
              leading: const Icon(Icons.logout, color: AppColors.logoutColor),
              title: const Text("Sign Out", style: TextStyle(color:AppColors.logoutColor)),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const CafeLoginPage()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
