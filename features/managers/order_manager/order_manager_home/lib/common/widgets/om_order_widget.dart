import 'package:core_ui/core_ui.dart';
import 'package:domain/models/order_history/order_model.dart';
import 'package:flutter/material.dart';
import 'package:order_manager_home/common/widgets/om_order_details.dart';

class OMOrderWidget extends StatelessWidget {
  final OrderModel model;
  final Size size;
  final Widget orderActions;

  const OMOrderWidget({
    required this.model,
    required this.size,
    required this.orderActions,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) {
              return OMOrderDetails(
                model: model,
                orderActions: orderActions,
              );
            },
          ),
        );
      },
      child: SizedBox(
        width: size.width * 0.9,
        height: size.height * 0.075,
        child: Padding(
          padding: EdgeInsets.only(bottom: 7),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              border: Border.all(color: theme.indicatorColor.withAlpha(150)),
            ),
            child: Center(
              child: Text(
                model.idHash,
                style: AppFonts.normal22.copyWith(
                  color: theme.primaryColor.withAlpha(175),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
