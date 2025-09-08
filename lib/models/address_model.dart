import 'package:hive_flutter/hive_flutter.dart';

part 'address_model.g.dart';

@HiveType(typeId: 2) 
class Address extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String details; 

  Address({required this.name, required this.details});
}
