import 'package:hive/hive.dart';
import 'menu_item.dart';

part 'cart_item.g.dart';

@HiveType(typeId: 1)
class CartItem extends HiveObject {
  @HiveField(0)
  String customerUsername; // 🔑 link to logged-in customer

  @HiveField(1)
  MenuItem menuItem;

  @HiveField(2)
  int quantity;

  CartItem({
    required this.customerUsername,
    required this.menuItem,
    this.quantity = 1,
  });
}
