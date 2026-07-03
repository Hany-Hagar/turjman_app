import 'package:get_it/get_it.dart';
import '../../features/home/presentation/manager/home_cubit.dart';
import '../../features/settings/presentation/manager/settings_cubit.dart';

var getIt = GetIt.instance;

void setupLocator() {
  // Settings
  getIt.registerLazySingleton<SettingsCubit>(() => SettingsCubit());

  // Home
  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit());

}
