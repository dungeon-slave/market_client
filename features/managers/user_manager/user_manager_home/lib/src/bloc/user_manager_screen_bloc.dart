import 'package:core/core.dart';

part 'user_manager_screen_event.dart';
part 'user_manager_screen_state.dart';

class UserManagerScreenBloc extends Bloc<UserManagerScreenEvent, UserManagerScreenState> {
  UserManagerScreenBloc() : super(UserManagerScreenState()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<UserManagerScreenState> emit) {

  }
}
