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

  Profile({
    required this.name,
    required this.email,
    this.phone = '',
    this.avatarUrl = '',
  });
}
