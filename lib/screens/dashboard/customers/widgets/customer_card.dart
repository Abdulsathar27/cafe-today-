import 'package:flutter/material.dart';

class CustomerCard extends StatelessWidget {
  final Map<String, String> data;

  const CustomerCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(data["name"]!, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(data["email"]!),
            Text(data["phone"]!),
            const SizedBox(height: 8),
            Text("Location: ${data["location"]}"),
            Text("Orders: ${data["orders"]}"),
            Text("Total Spent: ${data["spent"]}"),
            Text("Status: ${data["status"]}"),
            Text("Rating: ${data["rating"]}"),
            Text("Last Order: ${data["lastOrder"]}"),
          ],
        ),
      ),
    );
  }
}
