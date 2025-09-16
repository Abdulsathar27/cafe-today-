import 'package:hive/hive.dart';

part 'menu_item.g.dart';

@HiveType(typeId: 0)
class MenuItem {
  @HiveField(0)
  final String id; 

  @HiveField(1)
  final String title; 

  @HiveField(2)
  final String? description; 

  @HiveField(3)
  final int price; 

  @HiveField(4)
  final String? imageUrl; 

  @HiveField(5)
  final String category; 

  MenuItem({
    required this.id,
    required this.title,
    this.description,
    required this.price,
    this.imageUrl,
    required this.category,
  });
}
