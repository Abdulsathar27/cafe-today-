import 'package:cafebooking/data/cart_data.dart';
import 'package:cafebooking/screens/cart_items.dart';
import 'package:flutter/material.dart';


PreferredSizeWidget buildHomeAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("Cafe Today",
            style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
        Text("Order & Eat.", style: TextStyle(color: Colors.grey, fontSize: 14)),
      ],
    ),
    actions: [
      Stack(
        children: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => CartScreen()));
            },
          ),
          if (cartItems.isNotEmpty)
            Positioned(
              right: 8,
              top: 8,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                child: Text("${cartItems.length}",
                    style: const TextStyle(color: Colors.white, fontSize: 10)),
              ),
            )
        ],
      )
    ],
  );
}
