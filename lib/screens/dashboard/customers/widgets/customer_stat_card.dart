import 'package:flutter/material.dart';

class CustomerStatCard extends StatelessWidget {
  final String title;
  final String value;
  final String change;

  const CustomerStatCard({
    super.key,
    required this.title,
    required this.value,
    required this.change,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(change, style: const TextStyle(color: Colors.green)),
          ],
        ),
      ),
    );
  }
}
