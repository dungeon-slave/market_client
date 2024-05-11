import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:domain/models/order_history/order_model.dart';

abstract class OMOrdersFilter {
  static List<UserOrdersModel> filterByStatus(
    List<UserOrdersModel> orders,
    OrderStatus status,
  ) {
    return orders.map(
      (UserOrdersModel item) {
        return UserOrdersModel(
          userId: item.userId,
          orders: item.orders
              .where(
                (OrderModel element) => element.status == status,
              )
              .toList(growable: false),
        );
      },
    ).toList(growable: false);
  }
}
