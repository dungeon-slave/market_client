import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:domain/models/order_history/order_model.dart';
import 'package:flutter/material.dart';
import 'package:order_manager_home/common/ui_services/om_orders_filter.dart';
import 'package:order_manager_home/common/widgets/om_orders_subcategory.dart';

import '../bloc/current_orders_bloc.dart';
import 'current_order_actions.dart';

class CurrentOrdersBody extends StatelessWidget {
  late final List<UserOrdersModel> _readyItems =
      OMOrdersFilter.filterByStatus(state.orders.items, OrderStatus.ready);
  late final List<UserOrdersModel> _acceptedItems =
      OMOrdersFilter.filterByStatus(state.orders.items, OrderStatus.accepted);

  final CurrentOrdersState state;
  final CurrentOrdersBloc bloc;
  final Size size;

  CurrentOrdersBody({
    required this.state,
    required this.size,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        OMOrdersSubCategory(
          categoryName: 'Ready',
          size: size,
          items: _readyItems,
          isLoading: state.isLoading,
          orderActionsBuilder: ({OrderModel? model, String? userId}) =>
              CurrentOrderActions(
            orderModel: model!,
            userId: userId!,
            bloc: bloc,
          ),
        ),
        OMOrdersSubCategory(
          categoryName: 'Accepted',
          size: size,
          items: _acceptedItems,
          isLoading: state.isLoading,
          orderActionsBuilder: ({OrderModel? model, String? userId}) =>
              CurrentOrderActions(
            orderModel: model!,
            userId: userId!,
            bloc: bloc,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
