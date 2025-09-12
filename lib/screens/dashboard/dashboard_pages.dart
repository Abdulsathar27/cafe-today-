import 'package:cafebooking/screens/dashboard/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'widgets/revenue_card.dart';
import 'widgets/orders_today_card.dart';
import 'widgets/active_customers_card.dart';
import 'widgets/menu_items_card.dart';
import 'widgets/weekly_revenue_card.dart';
import 'widgets/recent_orders_list.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(title: const Text("Dashboard")),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Dashboard",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text("Welcome back! Here's what's happening at your cafe today."),
              SizedBox(height: 16),

              // Cards
              RevenueCard(),
              OrdersTodayCard(),
              ActiveCustomersCard(),
              MenuItemsCard(),

              SizedBox(height: 24),
              WeeklyRevenueCard(),
              SizedBox(height: 24),
              RecentOrdersList(),
            ],
          ),
        ),
      ),
    );
  }
}
