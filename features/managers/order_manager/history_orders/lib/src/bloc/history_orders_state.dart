part of 'history_orders_bloc.dart';

class HistoryOrdersState {
  final bool isLoading;
  final AllUsersOrdersModel orders;

  const HistoryOrdersState({
    required this.isLoading,
    required this.orders,
  });
}
