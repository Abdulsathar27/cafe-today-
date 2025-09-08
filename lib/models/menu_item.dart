import 'package:hive/hive.dart';

part 'menu_item.g.dart';

@HiveType(typeId: 0)
class MenuItem extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String description;

  @HiveField(3)
  String imageUrl;

  @HiveField(4)
  int price;

  @HiveField(5) 
  String? category;

  MenuItem({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
    this.category, 
  });
}
