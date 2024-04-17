import 'package:admin_home/src/ui/components/admin_navigation_bar.dart';
import 'package:admin_menu/admin_menu.gm.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.gm.dart';
import 'package:users/users.gm.dart';

@RoutePage()
class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppAutoTabsScaffold(
      routes: <PageRouteInfo>[
        AdminMenu(),
        Users(),
        SettingsRoute(),
      ],
      navigationBar: (TabsRouter router) => AdminNavigationBar(router: router),
    );
  }
}
