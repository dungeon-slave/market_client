import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class CatalogueManagerNavigationBar extends StatelessWidget {
  final TabsRouter _router;

  const CatalogueManagerNavigationBar({
    required TabsRouter router,
    super.key,
  }) : _router = router;

  @override
  Widget build(BuildContext context) {
    return AppBottomNavigationBar(
      router: _router,
      //todo: put necessary icons here
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          activeIcon: AppIcon(AppIconsData.selectedAdminMenu),
          icon: AppIcon(AppIconsData.unselectedAdminMenu),
          label: AppStrConstants.menuTitle,
        ),
        BottomNavigationBarItem(
          activeIcon: AppIcon(AppIconsData.selectedUsers),
          icon: AppIcon(AppIconsData.unselectedUsers),
          label: AppStrConstants.users,
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
