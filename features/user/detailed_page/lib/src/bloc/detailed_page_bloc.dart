import 'package:core/core.dart';

part 'detailed_page_event.dart';
part 'detailed_page_state.dart';

class DetailedPageBloc extends Bloc<DetailedPageEvent, DetailedPageState> {
  final StackRouter _stackRouter;

  DetailedPageBloc({
    required StackRouter appRouter,
  })  : _stackRouter = appRouter,
        super(const DetailedPageState()) {
    on<CloseDetailedEvent>(_close);
  }

  void _close(_, __) => _stackRouter.popForced();
}
