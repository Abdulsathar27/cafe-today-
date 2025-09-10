import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cafebooking/models/order_model.dart';
import 'package:cafebooking/constants/app_colors.dart';
import 'package:cafebooking/screens/orders/orders_page.dart';
import 'package:fl_chart/fl_chart.dart'; 

class OrderStatsCard extends StatelessWidget {
  const OrderStatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Hive.isBoxOpen('ordersBox')) {
      Hive.openBox<Order>('ordersBox');
    }

    return ValueListenableBuilder(
      valueListenable: Hive.box<Order>('ordersBox').listenable(),
      builder: (context, Box<Order> box, _) {
        final orders = box.values.toList();
        final int orderCount = orders.length;

        int totalSpent = 0;
        for (final order in orders) {
          try {
            totalSpent += order.total;
          } catch (_) {}
        }

       
        final double normalizedOrders = orderCount.toDouble();
        final double normalizedSpent =
            totalSpent > 0 ? totalSpent / 100.0 : 0; 

        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const OrdersPage()),
            );
          },
          child: Card(
            color: AppColors.badgeBg,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.access_time, color: AppColors.textPrimary, size: 20),
                      SizedBox(width: 6),
                      Text(
                        "Order Statistics",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                            color: AppColors.backgroundLight,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "$orderCount",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text("Orders"),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                            color: AppColors.backgroundLight,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "₹$totalSpent",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text("Spent"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    height: 180,
                    child: PieChart(
                      PieChartData(
                        sections: [
                          PieChartSectionData(
                            value: normalizedOrders,
                            color: AppColors.piechartod,
                            title: "Orders",
                            titleStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textWhite,
                            ),
                          ),
                          PieChartSectionData(
                            value: normalizedSpent,
                            color: AppColors.piechartst,
                            title: "Spent",
                            titleStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textWhite,
                            ),
                          ),
                        ],
                        sectionsSpace: 4,
                        centerSpaceRadius: 30,
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildLegendItem(AppColors.piechartod, "Orders"),
                      const SizedBox(width: 16),
                      _buildLegendItem(AppColors.piechartst, "Spent"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLegendItem(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
