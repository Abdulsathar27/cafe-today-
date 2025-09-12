import 'package:flutter/material.dart';
import 'customer_stat_card.dart';

class CustomerStatsSection extends StatelessWidget {
  const CustomerStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isPhone = MediaQuery.of(context).size.width < 600;

    return GridView.count(
      crossAxisCount: isPhone ? 2 : 4,
      shrinkWrap: true,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        CustomerStatCard(title: "Total Customers", value: "2,345", change: "+12.5% from last month"),
        CustomerStatCard(title: "New This Month", value: "127", change: "+8.2% from last month"),
        CustomerStatCard(title: "VIP Customers", value: "186", change: "+3.1% from last month"),
        CustomerStatCard(title: "Avg. Rating", value: "4.7", change: "+0.2 from last month"),
      ],
    );
  }
}
