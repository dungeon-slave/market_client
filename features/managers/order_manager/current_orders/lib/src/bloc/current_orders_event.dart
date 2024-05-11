part of 'current_orders_bloc.dart';

abstract class CurrentOrdersEvent {}

class InitEvent extends CurrentOrdersEvent {}

class UpdateOrderStatusEvent extends CurrentOrdersEvent {
  final OrderModel orderModel;
  final String userId;
  final NavigatorState navigator;

  UpdateOrderStatusEvent(
    this.orderModel,
    this.userId,
    this.navigator,
  );
}
