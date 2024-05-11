import 'package:admin_home/admin_home_screen.dart';
import 'package:admin_menu/admin_menu.dart';
import 'package:catalogue_manager_home/catalogue_manager_home_screen.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:current_orders/current_orders.dart';
import 'package:detailed_page/detailed_page.dart';
import 'package:dishes_menu/dishes_menu.dart';
import 'package:history_orders/history_orders.dart';
import 'package:order_manager_home/order_manager_home_screen.dart';
import 'package:user_home/user_home_screen.dart';
import 'package:main_screen/main_screen.dart';
import 'package:navigation/src/app_router/auth_guard.dart';
import 'package:navigation/src/hero_empty_router.dart';
import 'package:order_history/order_history.dart';
import 'package:settings/settings.dart';
import 'package:shopping_cart/shopping_cart.dart';
import 'package:sign_in_screen/sign_in_screen.dart';
import 'package:sign_up_screen/sign_up_screen.dart';
import 'package:user_manager_home/user_manager_home_screen.dart';
import 'package:users/users.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
  modules: <Type>[
    MainScreenModule,
    SignInModule,
    SignUpModule,
    SettingsModule,
    DishesMenuModule,
    DetailedPageModule,
    OrderHistoryModule,
    ShoppingCartModule,
    AdminHomeScreenModule,
    UserHomeScreenModule,
    UsersScreenModule,
    AdminMenuScreenModule,
    UserManagerHomeScreenModule,
    OrderManagerHomeScreenModule,
    CatalogueManagerHomeScreenModule,
    CurrentOrdersModule,
    HistoryOrdersModule,
  ],
)
class AppRouter extends _$AppRouter {
  final AutoRoute _settingsRoute = AutoRoute(
    path: 'settings',
    page: SettingsRoute.page,
  );
  final AuthGuard _authGuard;

  AppRouter({
    required AuthGuard authGuard,
  }) : _authGuard = authGuard;

  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          path: '/',
          page: MainRoute.page,
          children: <AutoRoute>[
            AutoRoute(
              path: 'sign',
              page: EmptySign.page,
              children: <AutoRoute>[
                CustomRoute(
                  path: '',
                  page: SignInRoute.page,
                  durationInMilliseconds: AppNumConstants.nestedDuration,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                ),
                CustomRoute(
                  path: 'up',
                  page: SignUpRoute.page,
                  durationInMilliseconds: AppNumConstants.nestedDuration,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                ),
              ],
            ),
            AutoRoute(
              path: 'home',
              page: UserHomeRoute.page,
              initial: true,
              guards: <AutoRouteGuard>[_authGuard],
              children: <AutoRoute>[
                AutoRoute(
                  path: 'dishesMenu',
                  page: EmptyDishesMenu.page,
                  children: <AutoRoute>[
                    AutoRoute(
                      path: '',
                      page: DishesMenuRoute.page,
                    ),
                    AutoRoute(
                      path: 'detailedPage',
                      page: DetailedPageRoute.page,
                    ),
                  ],
                ),
                AutoRoute(
                  path: 'orderHistory',
                  page: OrderHistoryRoute.page,
                  maintainState: false,
                ),
                AutoRoute(
                  path: 'shoppingCart',
                  page: ShoppingCartRoute.page,
                  maintainState: false,
                ),
                _settingsRoute,
              ],
            ),
            AutoRoute(
              page: UserManagerHomeRoute.page,
              path: 'userManager',
              children: <AutoRoute>[
                _settingsRoute,
              ],
            ),
            AutoRoute(
              page: OrderManagerHomeRoute.page,
              path: 'orderManager',
              children: <AutoRoute>[
                AutoRoute(
                  initial: true,
                  maintainState: false,
                  path: 'currentOrders',
                  page: CurrentOrdersRoute.page,
                ),
                AutoRoute(
                  maintainState: false,
                  path: 'historyOrders',
                  page: HistoryOrdersRoute.page,
                ),
                _settingsRoute,
              ],
            ),
            AutoRoute(
              page: CatalogueManagerHomeRoute.page,
              path: 'catalogueManager',
              children: <AutoRoute>[
                _settingsRoute,
              ],
            ),
          ],
        ),
      ];
}
