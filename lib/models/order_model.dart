// order_model.dart
import 'package:hive/hive.dart';
import 'order_item.dart';

part 'order_model.g.dart';

@HiveType(typeId: 5)
class Order extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  List<OrderItem> items;

  @HiveField(2)
  int total;

  @HiveField(3)
  DateTime date;

  @HiveField(4)
  String status; // e.g., "Placed", "Delivered"

  Order({
    required this.id,
    required this.items,
    required this.total,
    required this.date,
    this.status = 'Placed',
  });
}
