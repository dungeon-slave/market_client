import 'package:core/core.dart';
import 'package:core/services/network_service.dart';
import 'package:domain/usecase/home_screen/fetch_cart_count_usecase.dart';
import 'package:domain/usecase/text_scale/fetch_text_scale_usecase.dart';
import 'package:domain/usecase/theme/fetch_theme_usecase.dart';
import 'package:domain/usecase/usecase.dart';

part 'user_home_screen_event.dart';
part 'user_home_screen_state.dart';

class UserHomeScreenBloc extends Bloc<UserHomeScreenEvent, UserHomeScreenState> {
  final FetchCartCountUseCase _fetchCartCountUseCase;
  final NetworkService _networkService;

  UserHomeScreenBloc({
    required FetchCartCountUseCase fetchCartCountUseCase,
    required NetworkService networkService,
    required FetchThemeUseCase fetchThemeUseCase,
    required FetchTextScaleUseCase fetchTextScaleUseCase,
  })  : _fetchCartCountUseCase = fetchCartCountUseCase,
        _networkService = networkService,
        super(
          const UserHomeScreenState(
            count: 0,
            isConnected: false,
            isVisibleMessage: false,
          ),
        ) {
    on<ChangeCartCountEvent>(_changeCartCount);
    on<ChangeConnectionEvent>(_changeConnectionStatus);
    on<ShowMessageEvent>(_changeMessageVisibility);
    on<InitEvent>(_init);

    _networkService.addListener(
      () async => add(
        ChangeConnectionEvent(
          isConnected: await _networkService.checkConnection(),
        ),
      ),
    );

    add(InitEvent());
  }

  Future<void> _init(InitEvent event, Emitter<UserHomeScreenState> emit) async {
    emit(
      state.copyWith(
        count: _fetchCartCountUseCase.execute(const NoParams()),
      ),
    );
  }

  void _changeCartCount(
      ChangeCartCountEvent event, Emitter<UserHomeScreenState> emit) {
    emit(
      state.copyWith(
        count: _fetchCartCountUseCase.execute(const NoParams()),
      ),
    );
  }

  void _changeMessageVisibility(
      ShowMessageEvent event, Emitter<UserHomeScreenState> emit) {
    emit(
      state.copyWith(
        isVisibleMessage: false,
      ),
    );
  }

  void _changeConnectionStatus(
      ChangeConnectionEvent event, Emitter<UserHomeScreenState> emit) {
    emit(
      state.copyWith(
        isConnected: event.isConnected,
        isVisibleMessage: true,
      ),
    );
    Future.delayed(
      const Duration(seconds: 3),
      () => add(ShowMessageEvent(isVisible: false)),
    );
  }
}
