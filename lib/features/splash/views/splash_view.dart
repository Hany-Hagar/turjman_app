// ignore_for_file: use_build_context_synchronously

import '../../home/presentation/pages/views/home_view.dart';
import '../widgets/splash_body.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/nav_to.dart';
import '../../../core/di/server_locator.dart';
import '../../onBoarding/pages/views/on_boarding_view.dart';
import '../../settings/presentation/manager/settings_cubit.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    _initSplash();
  }

  Future<void> _initSplash() async {
    await Future.delayed(const Duration(seconds: 2));
    final isFirstTimeUser = getIt<SettingsCubit>().state.isFirstTime;

    if (isFirstTimeUser) {
      NavTo.push(context: context, nextPage: OnBoardingView());
    } else {
      NavTo.push(context: context, nextPage: HomeView());
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: SplashBody()),
    );
  }
}
