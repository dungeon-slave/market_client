part of 'user_home_screen_bloc.dart';

abstract class UserHomeScreenEvent {}

class InitEvent extends UserHomeScreenEvent {}

class ChangeCartCountEvent extends UserHomeScreenEvent {}

class ChangeConnectionEvent extends UserHomeScreenEvent {
  final bool isConnected;

  ChangeConnectionEvent({required this.isConnected});
}

class ShowMessageEvent extends UserHomeScreenEvent {
  final bool isVisible;

  ShowMessageEvent({required this.isVisible});
}
