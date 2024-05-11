import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:data/entities/dish_type/dish_type_entity.dart';
import 'package:data/entities/order_history/all_users_orders.dart';
import 'package:data/entities/order_history/order_entity.dart';
import 'package:data/entities/user/user_entity.dart';

import '../../entities/order_history/user_orders.dart';

class FirebaseProvider {
  Future<AllUsersOrders> fetchAllOrders() async {
    final List<QueryDocumentSnapshot<Map<String, dynamic>>> users =
        (await FirebaseFirestore.instance
                .collection(AppStrConstants.usersCollection)
                .get())
            .docs;

    final List<String> userIds = <String>[];

    for (final doc in users) {
      final data = doc.data();
      userIds.add(data['id'] as String);
    }

    final List<UserOrders> orders = <UserOrders>[];

    for (final String userId in userIds) {
      final doc1 = (await FirebaseFirestore.instance
              .collection(AppStrConstants.ordersCollection)
              .doc(userId)
              .collection(AppStrConstants.allUserOrdersCollection)
              .get())
          .docs;

      final List<Map<String, dynamic>> docs = <Map<String, dynamic>>[];

      doc1.forEach(
        (element) => docs.add(element.data()),
      );

      final userOrders = UserOrders(
        userId: userId,
        orders: docs.map(
          (e) {
            final OrderEntity entity = OrderEntity.fromJson(e);

            return entity;
          },
        ).toList(),
      );

      orders.add(userOrders);
    }

    return AllUsersOrders(items: orders);
  }

  Future<void> updateOrderStatus(
    OrderEntity order,
    String userId,
  ) async {
    return await FirebaseFirestore.instance
        .collection(AppStrConstants.ordersCollection)
        .doc(userId)
        .collection(AppStrConstants.allUserOrdersCollection)
        .doc(order.id)
        .update(order.toJson());
  }

  Future<List<DishTypeEntity>> fetchMenu() async {
    final List<QueryDocumentSnapshot<Map<String, dynamic>>> dishTypes =
        (await FirebaseFirestore.instance
                .collection(AppStrConstants.menuCollection)
                .get())
            .docs;

    return dishTypes
        .map(
          (QueryDocumentSnapshot<Map<String, dynamic>> dishType) =>
              DishTypeEntity.fromJson(dishType.data()),
        )
        .toList();
  }

  Future<List<OrderEntity>> fetchOrderHistory(String uid) async {
    final List<QueryDocumentSnapshot<Map<String, dynamic>>> orders =
        (await FirebaseFirestore.instance
                .collection(AppStrConstants.ordersCollection)
                .doc(uid)
                .collection(AppStrConstants.allUserOrdersCollection)
                .get())
            .docs;

    return orders
        .map(
          (QueryDocumentSnapshot<Map<String, dynamic>> order) =>
              OrderEntity.fromJson(order.data()),
        )
        .toList();
  }

  Future<Role> fetchRole(String uid) async {
    final String roleName = (await FirebaseFirestore.instance
            .collection(AppStrConstants.usersCollection)
            .doc(uid)
            .get())
        .data()?[AppStrConstants.userRoleField];

    return Role.values.byName(roleName);
  }

  Future<void> createUser(UserEntity entity) {
    return FirebaseFirestore.instance
        .collection(AppStrConstants.usersCollection)
        .doc(entity.id)
        .set(entity.toJson());
  }

  Future<void> sendOrder(OrderEntity order, String uid) {
    return FirebaseFirestore.instance
        .collection(AppStrConstants.ordersCollection)
        .doc(uid)
        .collection(AppStrConstants.allUserOrdersCollection)
        .doc(order.id)
        .set(order.toJson());
  }
}
