import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class OrderManagerNavigationBar extends StatelessWidget {
  final TabsRouter _router;

  const OrderManagerNavigationBar({
    required TabsRouter router,
    super.key,
  }) : _router = router;

  @override
  Widget build(BuildContext context) {
    return AppBottomNavigationBar(
      router: _router,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          activeIcon: AppIcon(AppIconsData.selectedUsers),
          icon: AppIcon(AppIconsData.unselectedUsers),
          label: 'History',
        ),
        BottomNavigationBarItem(
          activeIcon: AppIcon(AppIconsData.selectedAdminMenu),
          icon: AppIcon(AppIconsData.unselectedAdminMenu),
          label: 'Current',
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
