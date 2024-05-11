import 'package:domain/domain.dart';

import '../models/order_history/order_model.dart';

abstract class OrderManagerRepository {
  Future<AllUsersOrdersModel> fetchAllOrders();
  Future<void> updateOrderStatus((OrderModel, String) updatedOrder);
}
