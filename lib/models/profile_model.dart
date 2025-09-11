import 'package:hive/hive.dart';

part 'profile_model.g.dart';

@HiveType(typeId: 3)
class Profile extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String email;

  @HiveField(2)
  String phone;

  @HiveField(3)
  String avatarUrl;

  @HiveField(4)
  String role;

  @HiveField(5)
  String password; // ✅ new

  Profile({
    this.name = "",
    this.email = "",
    this.phone = "",
    this.avatarUrl = "",
    this.role = "customer",
    this.password = "",
  });
}
