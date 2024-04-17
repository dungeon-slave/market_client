import 'package:core/core.dart';
import 'package:flutter/material.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final TabsRouter router;
  final List<BottomNavigationBarItem> items;

  const AppBottomNavigationBar({
    required this.router,
    required this.items,
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
      items: items,
    );
  }
}
