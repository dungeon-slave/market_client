part of 'user_home_screen_bloc.dart';

class UserHomeScreenState {
  final int count;
  final bool isConnected;
  final bool isVisibleMessage;

  const UserHomeScreenState({
    required this.count,
    required this.isConnected,
    required this.isVisibleMessage,
  });

  UserHomeScreenState copyWith({
    int? count,
    bool? isConnected,
    bool? isVisibleMessage,
    bool? isDark,
    double? textScale,
  }) {
    return UserHomeScreenState(
      count: count ?? this.count,
      isConnected: isConnected ?? this.isConnected,
      isVisibleMessage: isVisibleMessage ?? this.isVisibleMessage,
    );
  }
}
