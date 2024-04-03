import 'package:core/core.dart';
import 'package:core/di/app_di.dart';
import 'package:core/services/network_service.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:user_home/src/bloc/user_home_screen_bloc.dart';
import 'package:user_home/src/ui/user_home_content.dart';

@RoutePage()
class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserHomeScreenBloc(
        fetchCartCountUseCase: appLocator<FetchCartCountUseCase>(),
        networkService: appLocator<NetworkService>(),
        fetchTextScaleUseCase: appLocator<FetchTextScaleUseCase>(),
        fetchThemeUseCase: appLocator<FetchThemeUseCase>(),
      ),
      child: const UserHomeContent(),
    );
  }
}
