import 'package:data/entities/order_history/order_entity.dart';
import 'package:data/mappers/cart_item_mapper.dart';
import 'package:domain/models/order_history/order_model.dart';
import 'package:domain/models/order_history/order_status_enum.dart';

abstract class OrderMapper {
  static OrderEntity toEntity(OrderModel model) {
    return OrderEntity(
      id: model.id,
      dateTime: model.dateTime,
      price: model.price,
      products: model.products.map(CartItemMapper.toEntity).toList(),
      //TODO: add also status here
    );
  }

  static OrderModel toModel(OrderEntity entity) {
    return OrderModel(
      id: entity.id.hashCode.toString(),
      dateTime: entity.dateTime,
      price: entity.price,
      products: entity.products.map(CartItemMapper.toModel).toList(),
      //TODO: replace this with real mapping
      status: OrderStatus.accepted,
    );
  }
}
