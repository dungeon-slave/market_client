import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:domain/models/order_history/order_model.dart';
import 'package:flutter/material.dart';

import 'om_order_widget.dart';

class OMOrdersSubCategory extends StatelessWidget {
  final Size size;
  final List<UserOrdersModel> items;
  final String categoryName;
  final bool isLoading;
  final Widget Function({
    OrderModel? model,
    String? userId,
  }) orderActionsBuilder;

  const OMOrdersSubCategory({
    required this.isLoading,
    required this.size,
    required this.items,
    required this.categoryName,
    required this.orderActionsBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final double borderWidth = 2;
    final Color borderColor = theme.indicatorColor.withAlpha(175);

    return Expanded(
      child: Container(
        margin: EdgeInsets.only(
          left: 10,
          right: 10,
          top: 10,
        ),
        width: size.width,
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: borderColor,
            width: borderWidth,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 5),
              child: Text(
                categoryName,
                style: TextStyle(
                  fontSize: 25,
                  color: theme.primaryColor.withAlpha(200),
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Divider(
              thickness: borderWidth,
              color: borderColor,
            ),
            SubCategoryContent(
              isLoading: isLoading,
              items: items,
              size: size,
              orderActionsBuilder: orderActionsBuilder,
            ),
          ],
        ),
      ),
    );
  }
}

class SubCategoryContent extends StatelessWidget {
  final bool isLoading;
  final List<UserOrdersModel> items;
  final Size size;
  final Widget Function({
    OrderModel? model,
    String? userId,
  }) orderActionsBuilder;

  const SubCategoryContent({
    required this.isLoading,
    required this.items,
    required this.size,
    required this.orderActionsBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: isLoading
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AppLoadingCircle(),
                SizedBox(height: 25),
              ],
            )
          : SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  for (final UserOrdersModel item in items)
                    for (final OrderModel order in item.orders)
                      OMOrderWidget(
                        model: order,
                        size: size,
                        orderActions: orderActionsBuilder(
                          model: order,
                          userId: item.userId,
                        ),
                      ),
                ],
              ),
            ),
    );
  }
}
