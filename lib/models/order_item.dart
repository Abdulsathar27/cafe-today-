import 'package:hive/hive.dart';

part 'order_item.g.dart';

@HiveType(typeId: 4)
class OrderItem extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  int price; 

  @HiveField(2)
  int quantity;

  @HiveField(3)
  String imageUrl;

  OrderItem({
    required this.title,
    required this.price,
    required this.quantity,
    this.imageUrl = '',
  });
}
