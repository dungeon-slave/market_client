import 'package:core/core.dart';
import 'package:domain/models/order_history/order_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:order_manager_home/common/widgets/om_order_action.dart';

import '../bloc/current_orders_bloc.dart';

class CurrentOrderActions extends StatelessWidget {
  final OrderModel orderModel;
  final String userId;
  final CurrentOrdersBloc bloc;

  const CurrentOrderActions({
    required this.orderModel,
    required this.userId,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    final NavigatorState navigator = Navigator.of(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          if (orderModel.status == OrderStatus.ready)
            OMOrderAction(
              onPressed: () {
                bloc.add(
                  _currentOrderCallback(
                    orderModel,
                    userId,
                    navigator,
                    OrderStatus.completed,
                  ),
                );
              },
              name: 'Close',
            )
          else
            OMOrderAction(
              onPressed: () {
                bloc.add(
                  _currentOrderCallback(
                    orderModel,
                    userId,
                    navigator,
                    OrderStatus.ready,
                  ),
                );
              },
              name: 'Complete',
            ),
          OMOrderAction(
            onPressed: () {
              bloc.add(
                _currentOrderCallback(
                  orderModel,
                  userId,
                  navigator,
                  OrderStatus.canceled,
                ),
              );
            },
            name: 'Cancel',
          ),
        ],
      ),
    );
  }

  UpdateOrderStatusEvent _currentOrderCallback(
    OrderModel orderModel,
    String userId,
    NavigatorState navigator,
    OrderStatus status,
  ) {
    return UpdateOrderStatusEvent(
      OrderModel(
        idHash: orderModel.idHash,
        dateTime: orderModel.dateTime,
        price: orderModel.price,
        status: status,
        products: orderModel.products,
        realId: orderModel.realId,
      ),
      userId,
      navigator,
    );
  }
}
