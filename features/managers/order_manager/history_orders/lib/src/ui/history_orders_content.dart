import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../bloc/history_orders_bloc.dart';
import 'history_orders_body.dart';

class HistoryOrdersContent extends StatelessWidget {
  final HistoryOrdersState state;

  const HistoryOrdersContent({
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return LayoutBuilder(
      builder: (_, BoxConstraints constraints) {
        return SafeArea(
          minimum: EdgeInsets.only(top: constraints.minHeight / 28),
          child: Scaffold(
            backgroundColor: theme.scaffoldBackgroundColor,
            appBar: AppBar(
              backgroundColor: theme.scaffoldBackgroundColor,
              centerTitle: true,
              automaticallyImplyLeading: false,
              title: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'History orders',
                  style: AppFonts.normal30.copyWith(
                    color: theme.primaryColor,
                  ),
                ),
              ),
            ),
            body: HistoryOrdersBody(
              state: state,
              size: Size(constraints.maxWidth, constraints.maxHeight),
            ),
          ),
        );
      },
    );
  }
}
