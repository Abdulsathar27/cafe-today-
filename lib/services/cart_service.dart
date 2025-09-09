import 'package:hive/hive.dart';
import 'package:cafebooking/models/cart_item.dart';
import 'package:cafebooking/models/menu_item.dart';

class CartService {
  static Box<CartItem> get _box => Hive.box<CartItem>('cartBox');

 
  static void addItem(MenuItem item) {
    final existingKey = _box.keys.firstWhere(
      (key) => _box.get(key)!.menuItem.id == item.id,
      orElse: () => null,
    );

    if (existingKey != null) {
      final existing = _box.get(existingKey)!;
      existing.quantity += 1;
      existing.save(); 
    } else {
      _box.add(CartItem(menuItem: item));
    }
  }


  static void removeItem(String id) {
    final key = _box.keys.firstWhere(
      (k) => _box.get(k)!.menuItem.id == id,
      orElse: () => null,
    );
    if (key != null) _box.delete(key);
  }

 
  static void updateQuantity(String id, int qty) {
    final key = _box.keys.firstWhere(
      (k) => _box.get(k)!.menuItem.id == id,
      orElse: () => null,
    );
    if (key != null) {
      final cartItem = _box.get(key)!;
      cartItem.quantity = qty;
      cartItem.save(); 
    }
  }

  
  static List<CartItem> getItems() => _box.values.toList();

  
  static int getTotal() => _box.values.fold(
        0,
        (sum, c) => sum + (c.menuItem.price * c.quantity),
      );

  
  static void clearCart() => _box.clear();
}
