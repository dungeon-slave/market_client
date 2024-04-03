import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import 'cart_count_badge.dart';

class UserNavigationBar extends StatelessWidget {
  final TabsRouter router;

  const UserNavigationBar({
    required this.router,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return BottomNavigationBar(
      backgroundColor: themeData.scaffoldBackgroundColor,
      currentIndex: router.activeIndex,
      onTap: router.setActiveIndex,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: themeData.indicatorColor,
      unselectedItemColor: themeData.indicatorColor,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          activeIcon: AppIcon(AppIconsData.selectedMenu),
          icon: AppIcon(AppIconsData.unselectedMenu),
          label: AppStrConstants.menuTitle,
        ),
        BottomNavigationBarItem(
          activeIcon: AppIcon(AppIconsData.selectedOrderHistory),
          icon: AppIcon(AppIconsData.unselectedOrderHistory),
          label: AppStrConstants.orderHistoryTitle,
        ),
        BottomNavigationBarItem(
          activeIcon: CartCountBadge(
            themeIcon: AppIcon(
              AppIconsData.selectedShoppingCart,
            ),
          ),
          icon: CartCountBadge(
            themeIcon: AppIcon(
              AppIconsData.unselectedShoppingCart,
            ),
          ),
          label: AppStrConstants.shoppingCartTitle,
        ),
        BottomNavigationBarItem(
          activeIcon: AppIcon(AppIconsData.selectedSettings),
          icon: AppIcon(AppIconsData.unselectedSettings),
          label: AppStrConstants.settingsTitle,
        ),
      ],
    );
  }
}
