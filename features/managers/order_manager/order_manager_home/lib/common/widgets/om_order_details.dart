import 'package:core_ui/core_ui.dart';
import 'package:domain/models/order_history/order_model.dart';
import 'package:flutter/material.dart';

class OMOrderDetails extends StatelessWidget {
  final OrderModel model;
  final Widget orderActions;

  const OMOrderDetails({
    required this.model,
    required this.orderActions,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Order ${model.idHash}',
                    style: AppFonts.normal30.copyWith(
                      color: theme.primaryColor,
                    ),
                  ),
                ),
              ),
              AdminOrderText('Status: ${model.status.value}'),
              AdminOrderText(
                'Received: ${model.dateTime.toString().split('.').first}',
              ),
              AdminOrderText('Price: ${model.price.toStringAsFixed(1)}\$'),
              AdminOrderText('Dishes:'),
              ...List.generate(
                model.products.length,
                (int index) {
                  return AdminOrderText(
                    '   -   ${model.products[index].dishModel.name} x ${model.products[index].count}',
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: orderActions,
    );
  }
}

class AdminOrderText extends StatelessWidget {
  final String text;

  const AdminOrderText(
    this.text,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(left: AppDimens.padding50),
      padding: const EdgeInsets.only(
        bottom: AppDimens.padding20,
      ),
      child: Text(
        text,
        style: AppFonts.normal24,
      ),
    );
  }
}
