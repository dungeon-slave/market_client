import 'package:core/core.dart';
import 'package:core/di/app_di.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:domain/models/cart_items/cart_item_model.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/src/ui/cart_item.dart';

import '../bloc/shopping_cart/shopping_cart_bloc.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShoppingCartBloc(
        getItemsUseCase: appLocator<GetItemsUseCase>(),
        changeItemCountUseCase: appLocator<ChangeItemCountUseCase>(),
        clearCartUseCase: appLocator<ClearCartUseCase>(),
      ),
      child: BlocBuilder<ShoppingCartBloc, ShoppingCartState>(
        builder: (BuildContext context, ShoppingCartState state) {
          if (state.isLoading) {
            return const AppLoadingCircle();
          }
          if (state.errorMessage.isNotEmpty) {
            return AppError(errorText: state.errorMessage);
          }
          return Scaffold(
            appBar: AppBar(
              actions: <Container>[
                Container(
                  margin: const EdgeInsets.only(right: AppDimens.padding10),
                  child: IconButton(
                    iconSize: 30,
                    icon: const Icon(Icons.delete),
                    onPressed: () =>
                        BlocProvider.of<ShoppingCartBloc>(context).add(
                      ClearCartEvent(),
                    ),
                  ),
                ),
              ],
              iconTheme: Theme.of(context).iconTheme,
              centerTitle: true,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: Text(
                AppConstants.shoppingCartTitle,
                style: AppFonts.normal25.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            body: Container(
              margin: const EdgeInsets.only(bottom: AppDimens.padding100),
              child: ListView.builder(
                padding: const EdgeInsets.all(AppDimens.padding10),
                itemCount: state.items.length,
                itemBuilder: (BuildContext context, int index) {
                  return CartItem(
                    model: CartItemModel(
                      dishModel: state.items[index].dishModel,
                      count: state.items[index].count,
                    ),
                  );
                },
              ),
            ),
            bottomSheet: Container(
              padding: const EdgeInsets.all(AppDimens.padding10),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                border: Border(
                  top: BorderSide(color: Theme.of(context).indicatorColor),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Text>[
                      const Text(
                        'Total',
                        style: AppFonts.normal22,
                      ),
                      Text(
                        '${state.totalPrice()}\$',
                        style: AppFonts.normal22,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: AppDimens.padding100 * 4,
                    child: AppButton(
                      text: 'Checkout',
                      handler: () =>
                          BlocProvider.of<ShoppingCartBloc>(context).add(
                        CheckoutEvent(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
