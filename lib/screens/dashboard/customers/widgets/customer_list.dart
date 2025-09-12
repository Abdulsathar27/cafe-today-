import 'package:flutter/material.dart';
import 'customer_card.dart';

class CustomerList extends StatelessWidget {
  const CustomerList({super.key});

  @override
  Widget build(BuildContext context) {
    final customers = [
      {
        "name": "John Doe",
        "email": "john.doe@email.com",
        "phone": "+1 (555) 123-4567",
        "location": "New York, NY",
        "orders": "42 orders",
        "spent": "\$485.50",
        "status": "REGULAR",
        "rating": "4.8",
        "lastOrder": "1/15/2024",
      },
      {
        "name": "Sarah Smith",
        "email": "sarah.smith@email.com",
        "phone": "+1 (555) 234-5678",
        "location": "Los Angeles, CA",
        "orders": "28 orders",
        "spent": "\$312.75",
        "status": "VIP",
        "rating": "4.6",
        "lastOrder": "2/20/2024",
      },
    ];

    return Column(
      children: customers.map((c) => CustomerCard(data: c)).toList(),
    );
  }
}
