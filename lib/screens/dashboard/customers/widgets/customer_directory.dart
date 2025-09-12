import 'package:flutter/material.dart';
import 'customer_search_bar.dart';
import 'customer_list.dart';

class CustomerDirectory extends StatelessWidget {
  const CustomerDirectory({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Customer Directory",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text("A list of all your customers and their details"),
            SizedBox(height: 12),
            CustomerSearchBar(),
            SizedBox(height: 12),
            CustomerList(),
          ],
        ),
      ),
    );
  }
}
