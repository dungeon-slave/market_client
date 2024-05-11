import 'package:data/entities/order_history/order_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_orders.freezed.dart';
part 'user_orders.g.dart';

@freezed
class UserOrders with _$UserOrders {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory UserOrders({
    required String userId,
    required List<OrderEntity> orders,
  }) = _UserOrders;

  factory UserOrders.fromJson(Map<String, dynamic> json) =>
      _$UserOrdersFromJson(json);
}
