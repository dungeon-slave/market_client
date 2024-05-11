part of 'current_orders_bloc.dart';

class CurrentOrdersState {
  final bool isLoading;
  final AllUsersOrdersModel orders;

  const CurrentOrdersState({
    required this.isLoading,
    required this.orders,
  });
}
