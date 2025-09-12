import 'package:flutter/material.dart';

class WeeklyRevenueCard extends StatelessWidget {
  const WeeklyRevenueCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SizedBox(
        height: 120,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.trending_up, size: 32, color: Colors.green),
              SizedBox(height: 8),
              Text("Revenue trending upward"),
              Text("\$14,200 this week",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
