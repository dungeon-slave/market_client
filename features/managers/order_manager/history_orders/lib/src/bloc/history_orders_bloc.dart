import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:domain/usecase/usecase.dart';

part 'history_orders_event.dart';
part 'history_orders_state.dart';

class HistoryOrdersBloc extends Bloc<HistoryOrdersEvent, HistoryOrdersState> {
  final FetchAllOrdersUseCase _fetchAllUsersOrdersUseCase;

  HistoryOrdersBloc({
    required FetchAllOrdersUseCase fetchAllOrdersUseCase,
  })  : _fetchAllUsersOrdersUseCase = fetchAllOrdersUseCase,
        super(
          HistoryOrdersState(
            orders: AllUsersOrdersModel(
              items: <UserOrdersModel>[],
            ),
            isLoading: true,
          ),
        ) {
    on<InitEvent>(_init);
    add(InitEvent());
  }

  void _init(InitEvent event, Emitter<HistoryOrdersState> emit) async {
    final AllUsersOrdersModel orders =
        await _fetchAllUsersOrdersUseCase.execute(NoParams());

    emit(
      HistoryOrdersState(
        orders: orders,
        isLoading: false,
      ),
    );
  }
}
