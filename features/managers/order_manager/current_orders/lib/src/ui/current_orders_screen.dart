import 'package:core/core.dart';
import 'package:core/di/app_di.dart';
import 'package:current_orders/src/bloc/current_orders_bloc.dart';
import 'package:current_orders/src/ui/current_orders_content.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CurrentOrdersScreen extends StatelessWidget {
  const CurrentOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CurrentOrdersBloc>(
      create: (_) => CurrentOrdersBloc(
        fetchAllOrdersUseCase: appLocator<FetchAllOrdersUseCase>(),
        updateOrderStatusUseCase: appLocator<UpdateOrderStatusUseCase>(),
      ),
      child: BlocBuilder<CurrentOrdersBloc, CurrentOrdersState>(
        builder: (BuildContext context, CurrentOrdersState state) {
          return CurrentOrdersContent(
            state: state,
            bloc: BlocProvider.of<CurrentOrdersBloc>(context),
          );
        },
      ),
    );
  }
}
