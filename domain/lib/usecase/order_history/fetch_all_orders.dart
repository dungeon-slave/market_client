import 'package:domain/domain.dart';

import '../usecase.dart';

class FetchAllOrdersUseCase
    implements AsyncUseCase<NoParams, AllUsersOrdersModel> {
  final OrderManagerRepository _orderManagerRepository;

  const FetchAllOrdersUseCase({
    required OrderManagerRepository orderManagerRepository,
  }) : _orderManagerRepository = orderManagerRepository;

  @override
  Future<AllUsersOrdersModel> execute(NoParams input) =>
      _orderManagerRepository.fetchAllOrders();
}
