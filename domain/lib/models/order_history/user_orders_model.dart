import 'order_model.dart';

class UserOrdersModel {
  final String userId;
  final List<OrderModel> orders;

  const UserOrdersModel({
    required this.userId,
    required this.orders,
  });
}
