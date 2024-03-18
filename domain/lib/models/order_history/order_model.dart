import 'package:domain/models/cart_items/cart_item_model.dart';

import 'order_status_enum.dart';

class OrderModel {
  final String id;
  final DateTime dateTime;
  final double price;
  final OrderStatus status;
  final List<CartItemModel> products;

  const OrderModel({
    required this.id,
    required this.dateTime,
    required this.price,
    required this.status,
    required this.products,
  });
}
