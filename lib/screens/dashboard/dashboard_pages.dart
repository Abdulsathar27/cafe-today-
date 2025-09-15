import 'package:cafebooking/screens/dashboard/widgets/admin_orders_card.dart';
import 'package:flutter/material.dart';
import 'package:cafebooking/constants/app_colors.dart';
import 'package:cafebooking/screens/dashboard/widgets/app_drawer.dart';




class DashboardPage extends StatelessWidget {
  final String adminName;
  final String adminEmail;
  final String? profileImage;

  const DashboardPage({
    super.key,
    this.adminName = " ",       
    this.adminEmail = "",  
    this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        backgroundColor: AppColors.primary,
      ),
      drawer: AppDrawer(
        profileImage: profileImage,
      ),
      backgroundColor: const Color(0xFFF2F2F2), 
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: const [
          
            AdminOrdersCard(), 
          ],
        ),
      ),
    );
  }
}
