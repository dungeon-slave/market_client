import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:user_home/src/bloc/cart_observer.dart';
import 'package:user_home/src/bloc/user_home_screen_bloc.dart';
import 'package:user_home/src/ui/components/user_navigation_bar.dart';
import 'package:navigation/navigation.dart';
import 'package:order_history/order_history.dart';
import 'package:settings/settings.dart';
import 'package:shopping_cart/shopping_cart.dart';

import 'components/network_popup.dart';

class UserHomeContent extends StatelessWidget {
  const UserHomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AppAutoTabsScaffold(
          routes: const <PageRouteInfo>[
            EmptyDishesMenu(),
            OrderHistoryRoute(),
            ShoppingCartRoute(),
            SettingsRoute(),
          ],
          //TODO: try to fix it
          navigationBar: (TabsRouter router) => UserNavigationBar(router: router),
        ),
        BlocBuilder<UserHomeScreenBloc, UserHomeScreenState>(
          builder: (BuildContext context, UserHomeScreenState state) {
            Bloc.observer = CartObserver(
              callback: () => BlocProvider.of<UserHomeScreenBloc>(context).add(
                ChangeCartCountEvent(),
              ),
            );
            if (state.isVisibleMessage) {
              return NetworkPopUp(isConnected: state.isConnected);
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
