import 'package:core/enums/order_status_enum.dart';
import 'package:domain/models/cart_items/cart_item_model.dart';

class OrderModel {
  final String idHash;
  final String realId;
  final DateTime dateTime;
  final double price;
  final OrderStatus status;
  final List<CartItemModel> products;

  const OrderModel({
    required this.idHash,
    required this.realId,
    required this.dateTime,
    required this.price,
    required this.status,
    required this.products,
  });
}
