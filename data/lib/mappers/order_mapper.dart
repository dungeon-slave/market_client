import 'package:data/entities/order_history/order_entity.dart';
import 'package:data/mappers/cart_item_mapper.dart';
import 'package:domain/models/order_history/order_model.dart';

abstract class OrderMapper {
  static OrderEntity toEntity(OrderModel model) {
    return OrderEntity(
      id: model.realId,
      dateTime: model.dateTime,
      price: model.price,
      products: model.products.map(CartItemMapper.toEntity).toList(),
      status: model.status,
    );
  }

  static OrderModel toModel(OrderEntity entity) {
    return OrderModel(
      idHash: entity.id.hashCode.toString(),
      dateTime: entity.dateTime,
      price: entity.price,
      products: entity.products.map(CartItemMapper.toModel).toList(),
      status: entity.status,
      realId: entity.id,
    );
  }
}
