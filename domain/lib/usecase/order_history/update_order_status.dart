import 'package:domain/domain.dart';
import 'package:domain/models/order_history/order_model.dart';

import '../usecase.dart';

class UpdateOrderStatusUseCase
    implements AsyncUseCase<(OrderModel, String), void> {
  final OrderManagerRepository _orderManagerRepository;

  const UpdateOrderStatusUseCase({
    required OrderManagerRepository orderManagerRepository,
  }) : _orderManagerRepository = orderManagerRepository;

  @override
  Future<void> execute((OrderModel, String) updatedOrder) =>
      _orderManagerRepository.updateOrderStatus(updatedOrder);
}
