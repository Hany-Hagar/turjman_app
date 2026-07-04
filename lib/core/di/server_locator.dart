import 'package:get_it/get_it.dart';
import '../../features/home/data/repo/home_repo.dart';
import '../../features/home/data/database/home_data.dart';
import '../../features/home/data/repo/home_repo_impl.dart';
import '../../features/home/presentation/manager/home_cubit.dart';
import '../../features/translations/data/repo/translations_repo.dart';
import '../../features/settings/presentation/manager/settings_cubit.dart';
import '../../features/translations/data/database/translations_data.dart';
import '../../features/translations/data/repo/translations_repo_impl.dart';
import '../../features/translations/presentation/manager/translations_cubit.dart';

var getIt = GetIt.instance;

void setupLocator() {
  // Services

  // Settings
  getIt.registerLazySingleton<SettingsCubit>(() => SettingsCubit());

  // Home

  getIt.registerLazySingleton<HomeData>(() => HomeData());

  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(homeData: getIt<HomeData>()),
  );

  getIt.registerLazySingleton<HomeCubit>(
    () => HomeCubit(homeRepo: getIt<HomeRepo>())..getSupportedLanguages(),
  );

  // Translations
  getIt.registerLazySingleton<TranslationsData>(() => TranslationsData());

  getIt.registerLazySingleton<TranslationsRepo>(
    () => TranslationsRepoImpl(translationsData: getIt<TranslationsData>()),
  );

  getIt.registerLazySingleton<TranslationsCubit>(
    () => TranslationsCubit(translationsRepo: getIt<TranslationsRepo>()),
  );
}
