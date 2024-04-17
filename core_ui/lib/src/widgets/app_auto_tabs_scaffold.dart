import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../theme/app_num_constants.dart';

class AppAutoTabsScaffold extends StatelessWidget {
  final List<PageRouteInfo> routes;
  final Widget Function(TabsRouter) navigationBar;

  const AppAutoTabsScaffold({
    required this.routes,
    required this.navigationBar,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return AutoTabsScaffold(
      routes: routes,
      animationCurve: Curves.linear,
      animationDuration: const Duration(
        milliseconds: AppNumConstants.mainDuration,
      ),
      transitionBuilder: (
        _,
        Widget child,
        Animation<double> animation,
      ) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      bottomNavigationBuilder: (_, TabsRouter router) {
        return DecoratedBox(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: themeData.indicatorColor),
            ),
          ),
          child: navigationBar(router),
        );
      },
    );
  }
}
