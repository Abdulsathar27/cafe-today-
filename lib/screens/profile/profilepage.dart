import 'package:cafebooking/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'widgets/profile_app_bar.dart';
import 'widgets/account_info_card.dart';
import 'widgets/order_stats_card.dart';
import 'widgets/quick_actions_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // top-left back arrow area is part of the custom app bar
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.gradientTop, AppColors.gradientBottom],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const ProfileAppBar(),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Column(
                    children: const [
                      AccountInfoCard(),
                      SizedBox(height: 12),
                      OrderStatsCard(),
                      SizedBox(height: 12),
                      QuickActionsCard(),
                      SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
