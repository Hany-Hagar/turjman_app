import '../widgets/splash_body.dart';
import 'package:flutter/material.dart';
import '../../../core/di/server_locator.dart';
import '../../settings/presentation/manager/settings_cubit.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  Future<void> initState() async {
    super.initState();
    await Future.delayed(const Duration(seconds: 2)); 
    final isFirstTimeUser = getIt<SettingsCubit>().state.isFirstTime;
    if (isFirstTimeUser) {
    } else {
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
        body: Center(
          child: SplashBody(),
        ),
    );
  }
}
