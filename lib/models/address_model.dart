import 'package:hive_flutter/hive_flutter.dart';

part 'address_model.g.dart';

@HiveType(typeId: 2) // must be unique ID
class Address extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String details; // e.g. "123 Main St, Kochi"

  Address({required this.name, required this.details});
}
