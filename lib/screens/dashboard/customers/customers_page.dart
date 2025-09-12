import 'package:cafebooking/screens/dashboard/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'widgets/customer_stats_section.dart';
import 'widgets/customer_directory.dart';

class CustomersPage extends StatelessWidget {
  const CustomersPage({super.key});

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
              Text("Customer Management",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text("View and manage your customer base and their preferences."),
              SizedBox(height: 16),

              // Stats
              CustomerStatsSection(),
              SizedBox(height: 16),

              // Directory
              CustomerDirectory(),
            ],
          ),
        ),
      ),
    );
  }
}
