import 'package:core/enums/order_status_enum.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class OrderItemConfiguration extends StatelessWidget {
  final Widget child;
  final OrderStatus orderStatus;

  const OrderItemConfiguration({
    required this.child,
    required this.orderStatus,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Container(
      padding: const EdgeInsets.only(
        left: AppDimens.padding15,
        top: AppDimens.padding20,
        bottom: AppDimens.padding10,
      ),
      margin: const EdgeInsets.only(
        top: AppDimens.margin5,
        bottom: AppDimens.margin5,
      ),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurStyle: BlurStyle.outer,
            blurRadius: AppDimens.padding10,
            color: themeData.cardColor,
          ),
        ],
        borderRadius: const BorderRadius.all(
          Radius.circular(AppDimens.radius10),
        ),
      ),
      child: child,
    );
  }
}
