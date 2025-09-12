import 'package:flutter/material.dart';

class ActiveCustomersCard extends StatelessWidget {
  const ActiveCustomersCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: const ListTile(
        title: Text("Active Customers", style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("2,345\n+3.1% from yesterday"),
      ),
    );
  }
}
