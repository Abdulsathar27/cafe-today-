import 'package:flutter/material.dart';
import 'package:cafebooking/models/order_model.dart';
import 'package:cafebooking/constants/app_colors.dart';

class OrderDetailsPage extends StatelessWidget {
  final Order order;
  const OrderDetailsPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
        backgroundColor: AppColors.primary,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Card(
              child: ListTile(
                title: Text('Order #${order.id}'),
                subtitle: Text('${order.date.toLocal()}'),
                trailing: Text(
                  '₹${order.total}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.separated(
                itemCount: order.items.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (context, i) {
                  final it = order.items[i];
                  return Card(
                    child: ListTile(
                      leading: it.imageUrl.isNotEmpty
                          ? Image.asset(
                              it.imageUrl,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            )
                          : CircleAvatar(
                              child: Text(
                                it.title.isNotEmpty
                                    ? it.title[0].toUpperCase()
                                    : '?',
                              ),
                            ),
                      title: Text(it.title),
                      subtitle: Text('Qty: ${it.quantity}'),
                      trailing: Text(
                        '₹${it.price * it.quantity}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
