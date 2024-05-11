import 'package:core/safe_request.dart';
import 'package:data/entities/order_history/all_users_orders.dart';
import 'package:data/mappers/order_mapper.dart';
import 'package:data/mappers/user_orders_mapper.dart';
import 'package:domain/models/order_history/all_users_orders_model.dart';
import 'package:domain/models/order_history/order_model.dart';
import 'package:domain/repositories/order_manager_repository.dart';

import '../entities/order_history/order_entity.dart';
import '../providers/remote/firebase_provider.dart';

class OrderManagerRepositoryImpl implements OrderManagerRepository {
  final FirebaseProvider _firebaseProvider;

  const OrderManagerRepositoryImpl({
    required FirebaseProvider firebaseProvider,
  }) : _firebaseProvider = firebaseProvider;

  @override
  Future<AllUsersOrdersModel> fetchAllOrders() async {
    final AllUsersOrders orders = await safeRequest<AllUsersOrders>(
      () => _firebaseProvider.fetchAllOrders(),
    );

    return UserOrdersMapper.toAllUsersModel(orders);
  }

  @override
  Future<void> updateOrderStatus((OrderModel, String) updatedOrder) {
    final OrderEntity order = OrderMapper.toEntity(updatedOrder.$1);

    return _firebaseProvider.updateOrderStatus(order, updatedOrder.$2);
  }
}
