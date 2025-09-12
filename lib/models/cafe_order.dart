import 'package:hive/hive.dart';

part 'cafe_order.g.dart'; // generated file

@HiveType(typeId: 6)
class CafeOrder {
  @HiveField(0)
  String id;

  @HiveField(1)
  List<String> items;

  @HiveField(2)
  String status; // pending, preparing, completed

  CafeOrder({
    required this.id,
    required this.items,
    this.status = 'pending',
  });
}
