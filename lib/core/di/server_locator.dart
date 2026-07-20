import 'package:get_it/get_it.dart';
import '../services/audio_service.dart';
import '../../features/home/data/repo/home_repo.dart';
import '../../features/audio/data/repo/audio_repo.dart';
import '../../features/image/data/repo/image_repo.dart';
import '../../features/home/data/database/home_data.dart';
import '../../features/home/data/repo/home_repo_impl.dart';
import '../../features/image/data/database/image_data.dart';
import '../../features/audio/data/database/audio_data.dart';
import '../../features/image/data/repo/image_repo_impl.dart';
import '../../features/audio/data/repo/audio_repo_impl.dart';
import '../../features/home/presentation/manager/home_cubit.dart';
import '../../features/audio/presentations/manager/audio_cubit.dart';
import '../../features/image/presentations/manager/image_cubit.dart';
import '../../features/translations/data/repo/translations_repo.dart';
import '../../features/settings/presentation/manager/settings_cubit.dart';
import '../../features/translations/data/database/translations_data.dart';
import '../../features/translations/data/repo/translations_repo_impl.dart';
import '../../features/offline_languages/data/repo/offline_languages_repo.dart';
import '../../features/translations/presentation/manager/translations_cubit.dart';
import '../../features/offline_languages/data/database/offline_languages_data.dart';
import '../../features/offline_languages/data/repo/offline_languages_repo_impl.dart';
import '../../features/offline_languages/presentation/manager/offline_languages_cubit.dart';

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
    () =>
        TranslationsCubit(translationsRepo: getIt<TranslationsRepo>())
          ..fetchTranslations(),
  );

  // Audio
  getIt.registerLazySingleton<AudioService>(() => AudioService()..init());

  getIt.registerLazySingleton<AudioData>(
    () => AudioData(audioService: getIt<AudioService>()),
  );

  getIt.registerLazySingleton<AudioRepo>(
    () => AudioRepoImpl(audioData: getIt<AudioData>()),
  );

  getIt.registerLazySingleton<AudioCubit>(
    () => AudioCubit(audioRepo: getIt<AudioRepo>()),
  );

  // Image

  getIt.registerLazySingleton<ImageData>(() => ImageData());

  getIt.registerLazySingleton<ImageRepo>(
    () => ImageRepoImpl(imageData: getIt<ImageData>()),
  );

  getIt.registerLazySingleton<ImageCubit>(
    () => ImageCubit(imageRepo: getIt<ImageRepo>()),
  );

  // Offline Languages
    getIt.registerLazySingleton<OfflineLanguagesData>(() => OfflineLanguagesData());

  getIt.registerLazySingleton<OfflineLanguagesRepo>(
    () => OfflineLanguagesRepoImpl(offlineLanguagesData: getIt<OfflineLanguagesData>()),
  );

  getIt.registerFactory<OfflineLanguagesCubit>(
    () => OfflineLanguagesCubit(offlineLanguagesRepo: getIt<OfflineLanguagesRepo>()),
  );
}
