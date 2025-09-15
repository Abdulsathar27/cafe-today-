import 'package:flutter/foundation.dart'; // for ValueListenable
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cafebooking/models/order_model.dart';
import 'package:cafebooking/models/cart_item.dart';
import 'package:cafebooking/models/order_item.dart';

class OrderService {
  final Box<Order> _orderBox = Hive.box<Order>('ordersBox');


  Future<void> placeOrder(List<CartItem> cartItems) async {
    int total = 0;

    final items = cartItems.map((c) {
      final price = c.menuItem.price;
      total += price * c.quantity;

      return OrderItem(
        title: c.menuItem.title,
        price: price,
        quantity: c.quantity,
        imageUrl: c.menuItem.imageUrl ?? "",
      );
    }).toList();

    final newOrder = Order(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      items: items,
      total: total,
      date: DateTime.now(),
      status: "Placed",
    );

    await _orderBox.add(newOrder);
  }

 
  Future<void> updateStatus(int index, String status) async {
    final order = _orderBox.getAt(index);
    if (order != null) {
      final updatedOrder = Order(
        id: order.id,
        items: order.items,
        total: order.total,
        date: order.date,
        status: status,
      );
      await _orderBox.putAt(index, updatedOrder);
    }
  }

  
  List<Order> getAllOrders() {
    return _orderBox.values.toList();
  }

  
  ValueListenable<Box<Order>> listenToOrders() {
    return _orderBox.listenable();
  }

  
  Future<void> clearAllOrders() async {
    await _orderBox.clear();
  }
}
