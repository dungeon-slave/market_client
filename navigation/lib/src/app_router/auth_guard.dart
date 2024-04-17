import 'package:admin_home/admin_home_screen.gm.dart';
import 'package:catalogue_manager_home/catalogue_manager_home_screen.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:order_manager_home/order_manager_home_screen.dart';
import 'package:sign_in_screen/sign_in_screen.dart';
import 'package:user_manager_home/user_manager_home_screen.dart';

class AuthGuard extends AutoRouteGuard {
  final AuthService _authService;

  const AuthGuard({
    required AuthService authService,
  }) : _authService = authService;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final PageRouteInfo route;

    switch (_authService.role) {
      case Role.undefined:
        {
          route = const EmptySign();
          break;
        }
      case Role.user:
        {
          resolver.next();
          return;
        }
      case Role.admin:
        {
          route = const AdminHomeRoute();
          break;
        }
      case Role.orderManager:
        {
          route = const OrderManagerHomeRoute();
          break;
        }
      case Role.catalogueManager:
        {
          route = const CatalogueManagerHomeRoute();
          break;
        }
      case Role.userManager:
        {
          route = const UserManagerHomeRoute();
          break;
        }
      default:
        {
          throw Exception(AppStrConstants.nonExistentRole);
        }
    }

    router.pushAndPopUntil(
      route,
      predicate: (_) => false,
    );
  }
}
