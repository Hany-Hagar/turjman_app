import 'splash_states.dart';
import '../../../core/di/server_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../settings/presentation/manager/settings_cubit.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void checkUserStatus() {
    final isFirstTimeUser = getIt<SettingsCubit>().state.isFirstTime; 
    if (isFirstTimeUser) {
      emit(FirstTimeUser());
    } else {
      emit(ReturningUser());
    }
  }
}