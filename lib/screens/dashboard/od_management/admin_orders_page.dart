import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart'; // ✅ for date formatting
import 'package:cafebooking/models/order_model.dart';
import 'package:cafebooking/constants/app_colors.dart';
import 'package:cafebooking/screens/dashboard/widgets/app_drawer.dart';

class AdminOrdersPage extends StatelessWidget {
  const AdminOrdersPage({super.key});

  Future<void> _updateStatus(int key, String status) async {
    final box = Hive.box<Order>('ordersBox');
    final order = box.get(key);

    if (order != null) {
      order.status = status;
      await box.put(key, order); // ✅ update by key
    }
  }

  String _formatDate(DateTime date) {
    return DateFormat('dd MMM yyyy, hh:mm a').format(date);
  }

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<Order>('ordersBox');

    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders Received"),
        backgroundColor: AppColors.primary,
        elevation: 2, // ✅ slight shadow for separation
      ),
      drawer: const AppDrawer(),

      // ✅ Light grey background (no fade effect)
      backgroundColor: const Color(0xFFF2F2F2),

      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: box.listenable(),
          builder: (context, Box<Order> box, _) {
            if (box.isEmpty) {
              return const Center(child: Text("No orders yet"));
            }

            // ✅ Get all orders with keys & sort latest first
            final orders = box.toMap().entries.toList()
              ..sort((a, b) => b.value.date.compareTo(a.value.date));

            return ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final entry = orders[index];
                final key = entry.key;
                final order = entry.value;

                return Card(
                  elevation: 5, // ✅ stronger shadow
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Order ID + Status
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Order #${order.id}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            DropdownButton<String>(
                              value: order.status,
                              items: const [
                                DropdownMenuItem(
                                    value: "Placed", child: Text("Placed")),
                                DropdownMenuItem(
                                    value: "Preparing",
                                    child: Text("Preparing")),
                                DropdownMenuItem(
                                    value: "Completed",
                                    child: Text("Completed")),
                              ],
                              onChanged: (value) {
                                if (value != null) _updateStatus(key, value);
                              },
                            ),
                          ],
                        ),

                        const SizedBox(height: 8),

                        // Items
                        Text(
                          "Items: ${order.items.map((i) => "${i.title} x${i.quantity}").join(", ")}",
                        ),

                        // Total
                        Text(
                          "Total: ₹${order.total}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        // Date
                        Text(
                          "Date: ${_formatDate(order.date)}",
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
