import 'package:core/core.dart';
import 'package:core/di/app_di.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../bloc/history_orders_bloc.dart';
import 'history_orders_content.dart';

@RoutePage()
class HistoryOrdersScreen extends StatelessWidget {
  const HistoryOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HistoryOrdersBloc>(
      create: (_) => HistoryOrdersBloc(
        fetchAllOrdersUseCase: appLocator<FetchAllOrdersUseCase>(),
      ),
      child: BlocBuilder<HistoryOrdersBloc, HistoryOrdersState>(
        builder: (_, HistoryOrdersState state) {
          return HistoryOrdersContent(state: state);
        },
      ),
    );
  }
}
