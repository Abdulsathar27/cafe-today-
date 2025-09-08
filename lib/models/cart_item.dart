import 'package:hive/hive.dart';
import 'menu_item.dart';

part 'cart_item.g.dart';

@HiveType(typeId: 1) 
class CartItem extends HiveObject { 
  @HiveField(0)
  final MenuItem menuItem;

  @HiveField(1)
  int quantity;

  CartItem({
    required this.menuItem,
    this.quantity = 1,
  });
}

