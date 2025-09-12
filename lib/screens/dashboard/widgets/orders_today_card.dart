import 'package:flutter/material.dart';

class OrdersTodayCard extends StatelessWidget {
  const OrdersTodayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: const ListTile(
        title: Text("Orders Today", style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("156\n+8.2% from yesterday"),
      ),
    );
  }
}
