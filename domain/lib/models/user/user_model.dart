import 'package:core/enums/role_enum.dart';

class UserModel {
  final String id;
  final Role role;

  const UserModel({
    required this.id,
    required this.role,
  });
}
