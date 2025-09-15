import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:cafebooking/models/order_model.dart';

class AdminOrdersCard extends StatelessWidget {
  const AdminOrdersCard({super.key});

  String _formatDate(DateTime date) {
    return DateFormat('dd MMM, hh:mm a').format(date);
  }

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<Order>('ordersBox');

    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Recent Orders",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Listen to order changes
            ValueListenableBuilder(
              valueListenable: box.listenable(),
              builder: (context, Box<Order> box, _) {
                if (box.isEmpty) {
                  return const Text("No recent orders yet");
                }

                // Sort orders by date (latest first)
                final orders = box.toMap().entries.toList()
                  ..sort((a, b) => b.value.date.compareTo(a.value.date));

                // Take only latest 3
                final recentOrders = orders.take(3).toList();

                return Column(
                  children: recentOrders.map((entry) {
                    final order = entry.value;
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text("Order #${order.id}"),
                      subtitle: Text(
                        "${order.items.map((i) => i.title).join(", ")}\n${_formatDate(order.date)}",
                      ),
                      trailing: Text(
                        order.status,
                        style: TextStyle(
                          color: order.status == "Completed"
                              ? Colors.green
                              : Colors.orange,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
