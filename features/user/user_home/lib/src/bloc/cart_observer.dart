import 'package:core/core.dart'
    show Bloc, Transition, BlocObserver;
import 'package:dishes_menu/dishes_menu.dart' show AddDishEvent;
import 'package:flutter/widgets.dart';
import 'package:shopping_cart/shopping_cart.dart' show ShoppingCartEvent;

class CartObserver extends BlocObserver {
  final VoidCallback callback;

  const CartObserver({
    required this.callback,
  });

  @override
  void onTransition(Bloc bloc, Transition transition) {
    if (transition.event is AddDishEvent ||
        transition.event is ShoppingCartEvent) {
      //TODO remvoe context
      callback();
    }
    super.onTransition(bloc, transition);
  }
}
