import 'package:cafebooking/screens/orders/widgets/order_details_page.dart';
import 'package:cafebooking/screens/menu/menu_page.dart'; 
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cafebooking/models/order_model.dart';
import 'package:cafebooking/constants/app_colors.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Hive.isBoxOpen('ordersBox')) Hive.openBox<Order>('ordersBox');

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
        backgroundColor: AppColors.primary,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => const MenuPage()),
              (route) => false,
            );
          },
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<Order>('ordersBox').listenable(),
        builder: (context, Box<Order> box, _) {
          final orders = box.values.toList().reversed.toList();

          if (orders.isEmpty) {
            return const Center(child: Text('No orders yet'));
          }

          return ListView.separated(
            padding: const EdgeInsets.all(12),
            itemCount: orders.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final order = orders[index];
              return ListTile(
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                title: Text('Order #${order.id}'),
                subtitle: Text('${order.items.length} items • ₹${order.total}'),
                trailing: Text(
                  order.status,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => OrderDetailsPage(order: order),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
