import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:order_manager_home/src/ui/components/order_manager_navigation_bar.dart';
import 'package:settings/settings.gm.dart';

@RoutePage()
class OrderManagerHomeScreen extends StatelessWidget {
  const OrderManagerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppAutoTabsScaffold(
      routes: <PageRouteInfo>[
        SettingsRoute(),
      ],
      navigationBar: (TabsRouter router) =>
          OrderManagerNavigationBar(router: router),
    );
  }
}
