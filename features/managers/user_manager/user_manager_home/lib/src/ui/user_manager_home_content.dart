import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.gm.dart';

import 'components/user_manager_navigation_bar.dart';

@RoutePage()
class UserManagerHomeScreen extends StatelessWidget {
  const UserManagerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppAutoTabsScaffold(
      routes: <PageRouteInfo>[
        SettingsRoute(),
      ],
      navigationBar: (TabsRouter router) =>
          UserManagerNavigationBar(router: router),
    );
  }
}
