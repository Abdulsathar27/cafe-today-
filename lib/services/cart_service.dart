import 'package:hive/hive.dart';
import 'package:cafebooking/models/cart_item.dart';
import 'package:cafebooking/models/menu_item.dart';

class CartService {
  static Box<CartItem> get _box => Hive.box<CartItem>('cartBox');

  /// Add an item to the cart
  static void addItem(MenuItem item) {
    final existingKey = _box.keys.firstWhere(
      (key) => _box.get(key)!.menuItem.id == item.id,
      orElse: () => null,
    );

    if (existingKey != null) {
      final existing = _box.get(existingKey)!;
      existing.quantity += 1;
      existing.save(); // ✅ works now because CartItem extends HiveObject
    } else {
      _box.add(CartItem(menuItem: item));
    }
  }

  /// Remove item by id
  static void removeItem(String id) {
    final key = _box.keys.firstWhere(
      (k) => _box.get(k)!.menuItem.id == id,
      orElse: () => null,
    );
    if (key != null) _box.delete(key);
  }

  /// Update item quantity
  static void updateQuantity(String id, int qty) {
    final key = _box.keys.firstWhere(
      (k) => _box.get(k)!.menuItem.id == id,
      orElse: () => null,
    );
    if (key != null) {
      final cartItem = _box.get(key)!;
      cartItem.quantity = qty;
      cartItem.save(); // ✅ now valid
    }
  }

  /// Get all items
  static List<CartItem> getItems() => _box.values.toList();

  /// Calculate total price
  static int getTotal() => _box.values.fold(
        0,
        (sum, c) => sum + (c.menuItem.price * c.quantity),
      );

  /// Clear cart
  static void clearCart() => _box.clear();
}
