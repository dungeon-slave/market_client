import 'package:data/entities/order_history/all_users_orders.dart';
import 'package:data/entities/order_history/user_orders.dart';
import 'package:data/mappers/order_mapper.dart';
import 'package:domain/domain.dart';

abstract class UserOrdersMapper {
  static AllUsersOrdersModel toAllUsersModel(AllUsersOrders entity) {
    return AllUsersOrdersModel(
      items: entity.items
          .map(
            (UserOrders orders) => UserOrdersMapper.toModel(orders),
          )
          .toList(),
    );
  }

  static AllUsersOrders toAllUsersEntity(AllUsersOrdersModel model) {
    return AllUsersOrders(
      items: model.items
          .map(
            (UserOrdersModel orders) => UserOrdersMapper.toEntity(orders),
          )
          .toList(),
    );
  }

  static UserOrdersModel toModel(UserOrders entity) {
    return UserOrdersModel(
      userId: entity.userId,
      orders: entity.orders
          .map(
            (e) => OrderMapper.toModel(e),
          )
          .toList(growable: false),
    );
  }

  static UserOrders toEntity(UserOrdersModel model) {
    return UserOrders(
      userId: model.userId,
      orders: model.orders
          .map(
            (e) => OrderMapper.toEntity(e),
          )
          .toList(growable: false),
    );
  }
}
