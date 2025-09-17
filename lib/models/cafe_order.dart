import 'package:hive/hive.dart';
import 'order_item.dart';

part 'cafe_order.g.dart';

@HiveType(typeId: 6)
class CafeOrder extends HiveObject {
  @HiveField(0)
  String customerUsername;

  @HiveField(1)
  List<OrderItem> items;

  @HiveField(2)
  DateTime date;

  CafeOrder({
    required this.customerUsername,
    required this.items,
    required this.date,
  });
}
