import 'package:core/core.dart';

part 'order_manager_screen_event.dart';
part 'order_manager_screen_state.dart';

class OrderManagerScreenBloc extends Bloc<OrderManagerScreenEvent, OrderManagerScreenState> {
  OrderManagerScreenBloc() : super(OrderManagerScreenState()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<OrderManagerScreenState> emit) {

  }
}
