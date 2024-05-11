import 'package:flutter/material.dart';
import 'package:order_manager_home/common/widgets/om_order_action.dart';

class HistoryOrderActions extends StatelessWidget {
  const HistoryOrderActions();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OMOrderAction(
        onPressed: Navigator.of(context).pop,
        name: 'Close details',
      ),
    );
  }
}
