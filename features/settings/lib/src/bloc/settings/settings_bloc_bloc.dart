import 'package:core/core.dart' show Bloc, Emitter;
import 'package:core/services/auth_service.dart';
import 'package:core/services/url_service.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:domain/usecase/usecase.dart';
import 'package:home_screen/home_screen.gm.dart';
import 'package:navigation/navigation.dart' show AppRouter;

part 'settings_bloc_event.dart';
part 'settings_bloc_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SetThemeUseCase _setThemeUseCase;
  final FetchThemeUseCase _fetchThemeUseCase;
  final SignOutUseCase _signOutUseCase;
  final CheckUserUseCase _checkUserUseCase;
  final SetTextScaleUseCase _setTextScaleUseCase;
  final FetchTextScaleUseCase _fetchTextScaleUseCase;
  final AuthService _authService;
  final UrlService _urlService;
  final AppRouter _appRouter;

  SettingsBloc({
    required SetThemeUseCase setThemeUseCase,
    required FetchThemeUseCase fetchThemeUseCase,
    required SetTextScaleUseCase setTextScaleUseCase,
    required FetchTextScaleUseCase fetchTextScaleUseCase,
    required SignOutUseCase signOutUseCase,
    required CheckUserUseCase checkUserUseCase,
    required UrlService urlService,
    required AuthService authService,
    required AppRouter appRouter,
  })  : _fetchThemeUseCase = fetchThemeUseCase,
        _setTextScaleUseCase = setTextScaleUseCase,
        _fetchTextScaleUseCase = fetchTextScaleUseCase,
        _urlService = urlService,
        _signOutUseCase = signOutUseCase,
        _checkUserUseCase = checkUserUseCase,
        _setThemeUseCase = setThemeUseCase,
        _authService = authService,
        _appRouter = appRouter,
        super(SettingsState(
          isDark: true,
          textScale: AppConstants.textScales.first,
        )) {
    on<SetThemeEvent>(_setTheme);
    on<FetchThemeEvent>(_fetchTheme);
    on<SetTextScaleEvent>(_setTextScale);
    on<FetchTextScaleEvent>(_fetchTextScale);
    on<OpenLinkEvent>(_openLink);
    on<SignOutEvent>(_signOut);

    //FIXME unite this in SettingsModel
    add(FetchThemeEvent());
    add(FetchTextScaleEvent());
  }

  Future<void> _signOut(SignOutEvent event, Emitter<SettingsState> emit) async {
    await _signOutUseCase.execute(const NoParams());
    _authService.authenticated = _checkUserUseCase.execute(const NoParams());
    _appRouter.replace(const HomeRoute());
  }

  Future<void> _openLink(
      OpenLinkEvent event, Emitter<SettingsState> emit) async {
    _urlService.openDefault(event.link);
  }

  Future<void> _setTheme(
      SetThemeEvent event, Emitter<SettingsState> emit) async {
    await _setThemeUseCase.execute(event.isDark);
    emit(
      state.copyWith(
        isDark: event.isDark,
      ),
    );
  }

  Future<void> _setTextScale(
      SetTextScaleEvent event, Emitter<SettingsState> emit) async {
    await _setTextScaleUseCase.execute(event.textScale);
    emit(
      state.copyWith(
        textScale: event.textScale,
      ),
    );
  }

  void _fetchTheme(FetchThemeEvent event, Emitter<SettingsState> emit) {
    emit(
      state.copyWith(
        isDark: _fetchThemeUseCase.execute(const NoParams()),
      ),
    );
  }

  void _fetchTextScale(FetchTextScaleEvent event, Emitter<SettingsState> emit) {
    emit(
      state.copyWith(
        textScale: _fetchTextScaleUseCase.execute(
          const NoParams(),
        ),
      ),
    );
  }
}
