import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const <PageRouteInfo>[
        EmptyRoute(),
        OrderHistoryRoute(),
        ShoppingCartRoute(),
        AppSettingsRoute(),
      ],
      animationDuration: Duration.zero,
      bottomNavigationBuilder: (BuildContext context, TabsRouter router) {
        return BottomNavigationBar(
          currentIndex: router.activeIndex,
          onTap: router.setActiveIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          selectedItemColor: Theme.of(context).indicatorColor,
          unselectedItemColor: Theme.of(context).indicatorColor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              activeIcon: AppIcons.selectedMenu,
              icon: AppIcons.unselectedMenu,
              label: AppConstants.navBarMenu,
            ),
            BottomNavigationBarItem(
              activeIcon: AppIcons.selectedOrderHistory,
              icon: AppIcons.unselectedOrderHistory,
              label: AppConstants.navBarOrderHistory,
            ),
            BottomNavigationBarItem(
              activeIcon: AppIcons.selectedShoppingCart,
              icon: AppIcons.unselectedShoppingCart,
              label: AppConstants.navBarShoppingCart,
            ),
            BottomNavigationBarItem(
              activeIcon: AppIcons.selectedSettings,
              icon: AppIcons.unselectedSettings,
              label: AppConstants.navBarSettings,
            ),
          ],
        );
      },
    );
  }
}
