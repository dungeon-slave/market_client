import 'package:core/core.dart';

part 'catalogue_manager_screen_event.dart';
part 'catalogue_manager_screen_state.dart';

class CatalogueManagerScreenBloc extends Bloc<CatalogueManagerScreenEvent, CatalogueManagerScreenState> {
  CatalogueManagerScreenBloc() : super(CatalogueManagerScreenState()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<CatalogueManagerScreenState> emit) {

  }
}
