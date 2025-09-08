import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cafebooking/models/order_model.dart';
import 'package:cafebooking/constants/app_colors.dart';
import 'package:cafebooking/screens/orders/orders_page.dart';

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

        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const OrdersPage()),
            );
          },
          child: Card(
            color:AppColors.badgeBg, 
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
                      Icon(Icons.access_time, color: Colors.black54, size: 20),
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
                            color:AppColors.backgroundLight, 
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
                            color:AppColors.backgroundLight, 
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
