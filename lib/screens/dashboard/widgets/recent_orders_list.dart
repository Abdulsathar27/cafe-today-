import 'package:flutter/material.dart';

class RecentOrdersList extends StatelessWidget {
  const RecentOrdersList({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = [
      {"name": "John Doe", "status": "completed", "price": "\$18.50", "time": "2 min ago"},
      {"name": "Sarah Smith", "status": "in-progress", "price": "\$12.75", "time": "5 min ago"},
      {"name": "Mike Johnson", "status": "pending", "price": "\$24.00", "time": "8 min ago"},
      {"name": "Emma Wilson", "status": "completed", "price": "\$4.50", "time": "12 min ago"},
      {"name": "Alex Brown", "status": "completed", "price": "\$22.25", "time": "15 min ago"},
    ];

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Recent Orders",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text("Latest customer orders"),
            const SizedBox(height: 12),
            ...orders.map((order) => ListTile(
                  title: Text(order["name"]!),
                  subtitle: Text(order["status"]!),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(order["price"]!,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text(order["time"]!,
                          style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
