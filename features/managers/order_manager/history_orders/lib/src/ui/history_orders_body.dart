import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:domain/models/order_history/order_model.dart';
import 'package:flutter/material.dart';
import 'package:history_orders/src/ui/history_order_actions.dart';
import 'package:order_manager_home/common/ui_services/om_orders_filter.dart';
import 'package:order_manager_home/common/widgets/om_orders_subcategory.dart';

import '../bloc/history_orders_bloc.dart';

class HistoryOrdersBody extends StatelessWidget {
  late final List<UserOrdersModel> _completedItems =
      OMOrdersFilter.filterByStatus(state.orders.items, OrderStatus.completed);
  late final List<UserOrdersModel> _canceledItems =
      OMOrdersFilter.filterByStatus(state.orders.items, OrderStatus.canceled);

  final HistoryOrdersState state;
  final Size size;

  HistoryOrdersBody({
    required this.state,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        OMOrdersSubCategory(
          categoryName: 'Completed',
          size: size,
          items: _completedItems,
          isLoading: state.isLoading,
          orderActionsBuilder: ({OrderModel? model, String? userId}) =>
              HistoryOrderActions(),
        ),
        OMOrdersSubCategory(
          categoryName: 'Canceled',
          size: size,
          items: _canceledItems,
          isLoading: state.isLoading,
          orderActionsBuilder: ({OrderModel? model, String? userId}) =>
              HistoryOrderActions(),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
