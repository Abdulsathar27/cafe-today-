import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  final String name;
  final double totalPrice;
  final String description;

  const ProductDescription({
    super.key,
    required this.name,
    required this.totalPrice,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Text(
          "Total Price: \$${totalPrice.toStringAsFixed(2)}",
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
        const SizedBox(height: 10),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
