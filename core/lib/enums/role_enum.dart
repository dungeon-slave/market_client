import 'package:core/core.dart';

part 'role_enum.g.dart';

@HiveType(typeId: 4)
enum Role {
  @HiveField(0)
  undefined,
  @HiveField(1)
  user,
  @HiveField(2)
  admin,
  @HiveField(3)
  orderManager,
  @HiveField(4)
  userManager,
  @HiveField(5)
  catalogueManager,
}
