import 'package:hive/hive.dart';

part 'customer_model.g.dart';

@HiveType(typeId: 8) // make sure it's unique!
class CustomerModel extends HiveObject {
  @HiveField(0)
  String username;

  @HiveField(1)
  String email;

  @HiveField(2)
  String password;

  CustomerModel({
    required this.username,
    required this.email,
    required this.password,
  });
}
