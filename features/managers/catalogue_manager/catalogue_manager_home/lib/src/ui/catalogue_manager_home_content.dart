import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings.gm.dart';

import 'components/catalogue_manager_navigation_bar.dart';

@RoutePage()
class CatalogueManagerHomeScreen extends StatelessWidget {
  const CatalogueManagerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppAutoTabsScaffold(
      routes: <PageRouteInfo>[
        SettingsRoute(),
      ],
      navigationBar: (TabsRouter router) =>
          CatalogueManagerNavigationBar(router: router),
    );
  }
}
