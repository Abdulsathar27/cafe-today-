import 'package:flutter/material.dart';

class RevenueCard extends StatelessWidget {
  const RevenueCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Total Revenue", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text("\$12,456", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text("+12.5% from yesterday", style: TextStyle(color: Colors.green)),
          ],
        ),
      ),
    );
  }
}
