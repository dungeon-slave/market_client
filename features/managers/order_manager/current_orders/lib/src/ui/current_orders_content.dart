import 'package:core_ui/core_ui.dart';
import 'package:current_orders/src/bloc/current_orders_bloc.dart';
import 'package:flutter/material.dart';

import 'current_orders_body.dart';

class CurrentOrdersContent extends StatelessWidget {
  final CurrentOrdersState state;
  final CurrentOrdersBloc bloc;

  const CurrentOrdersContent({
    required this.state,
    required this.bloc,
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
                  'Current orders',
                  style: AppFonts.normal30.copyWith(
                    color: theme.primaryColor,
                  ),
                ),
              ),
            ),
            body: CurrentOrdersBody(
              state: state,
              size: Size(constraints.maxWidth, constraints.maxHeight),
              bloc: bloc,
            ),
          ),
        );
      },
    );
  }
}
