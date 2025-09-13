import 'package:hive/hive.dart';

part 'menu_item.g.dart';

@HiveType(typeId: 0)
class MenuItem {
  @HiveField(0)
  final String id; // always required

  @HiveField(1)
  final String title; // always required

  @HiveField(2)
  final String? description; // optional

  @HiveField(3)
  final int price; // always required

  @HiveField(4)
  final String? imageUrl; // optional

  @HiveField(5)
  final String category; // always required

  MenuItem({
    required this.id,
    required this.title,
    this.description,
    required this.price,
    this.imageUrl,
    required this.category,
  });
}
