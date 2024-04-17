import 'package:core/core.dart';
import 'package:dishes_menu/dishes_menu.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_cart/shopping_cart.dart';

class CartObserver extends BlocObserver {
  final VoidCallback _callBack;

  const CartObserver({
    required VoidCallback callback,
  }) : _callBack = callback;

  @override
  void onTransition(Bloc bloc, Transition transition) {
    final bool shouldRunAction = transition.event is AddDishEvent ||
        transition.event is ShoppingCartEvent;

    if (shouldRunAction) _callBack();

    super.onTransition(bloc, transition);
  }
}
