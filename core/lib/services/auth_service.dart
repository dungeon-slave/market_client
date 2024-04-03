import 'package:core/enums/role_enum.dart';
import 'package:flutter/widgets.dart';

class AuthService extends ChangeNotifier {
  Role _role = Role.undefined;

  Role get role => _role;

  set role(Role value) {
    _role = value;
    notifyListeners();
  }
}
