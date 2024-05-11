import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:domain/models/order_history/order_model.dart';
import 'package:domain/usecase/usecase.dart';
import 'package:flutter/material.dart';

part 'current_orders_event.dart';
part 'current_orders_state.dart';

class CurrentOrdersBloc extends Bloc<CurrentOrdersEvent, CurrentOrdersState> {
  final FetchAllOrdersUseCase _fetchAllUsersOrdersUseCase;
  final UpdateOrderStatusUseCase _updateOrderStatusUseCase;

  CurrentOrdersBloc({
    required FetchAllOrdersUseCase fetchAllOrdersUseCase,
    required UpdateOrderStatusUseCase updateOrderStatusUseCase,
  })  : _fetchAllUsersOrdersUseCase = fetchAllOrdersUseCase,
        _updateOrderStatusUseCase = updateOrderStatusUseCase,
        super(
          CurrentOrdersState(
            orders: AllUsersOrdersModel(
              items: <UserOrdersModel>[],
            ),
            isLoading: true,
          ),
        ) {
    on<InitEvent>(_init);
    on<UpdateOrderStatusEvent>(_updateOrderStatus);

    add(InitEvent());
  }

  void _init(InitEvent event, Emitter<CurrentOrdersState> emit) async {
    final AllUsersOrdersModel orders =
        await _fetchAllUsersOrdersUseCase.execute(NoParams());

    emit(
      CurrentOrdersState(
        orders: orders,
        isLoading: false,
      ),
    );
  }

  void _updateOrderStatus(
    UpdateOrderStatusEvent event,
    Emitter<CurrentOrdersState> emit,
  ) async {
    emit(
      CurrentOrdersState(
        orders: state.orders,
        isLoading: true,
      ),
    );

    event.navigator.pop();

    await _updateOrderStatusUseCase.execute(
      (
        event.orderModel,
        event.userId,
      ),
    );

    add(InitEvent());
  }
}
