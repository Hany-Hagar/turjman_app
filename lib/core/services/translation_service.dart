import '../di/server_locator.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';
import '../../features/settings/presentation/manager/settings_cubit.dart';

class TranslationService {
  TranslationService();

  static final OnDeviceTranslatorModelManager _modelManager =
      OnDeviceTranslatorModelManager();

  static List<TranslateLanguage> get supportedLanguages =>
      TranslateLanguage.values;

  static Future<
    ({
      List<TranslateLanguage> downloaded,
      List<TranslateLanguage> notDownloaded,
    })
  >
  getLanguages() async {
    final downloaded = <TranslateLanguage>[];
    final notDownloaded = <TranslateLanguage>[];

    final results = await Future.wait(
      TranslateLanguage.values.map((language) async {
        final isDownloaded = await _modelManager.isModelDownloaded(
          language.bcpCode,
        );
        return (language, isDownloaded);
      }),
    );
    for (final result in results) {
      if (result.$2) {
        downloaded.add(result.$1);
      } else {
        notDownloaded.add(result.$1);
      }
    }

    return (downloaded: downloaded, notDownloaded: notDownloaded);
  }

  static Future<void> downloadLanguage(TranslateLanguage language) async {
    await _modelManager.downloadModel(
      language.bcpCode,
      isWifiRequired: getIt<SettingsCubit>().state.downloadOverWiFiOnly,
      );
  }

  static Future<void> deleteLanguage(TranslateLanguage language) async {
    await _modelManager.deleteModel(language.bcpCode);
  }

  static Future<bool> isLanguageDownloaded(TranslateLanguage language) {
    return _modelManager.isModelDownloaded(language.bcpCode);
  }

  static Future<String> translate({
    required String text,
    required TranslateLanguage source,
    required TranslateLanguage target,
  }) async {
    final translator = OnDeviceTranslator(
      sourceLanguage: source,
      targetLanguage: target,
    );
    final result = await translator.translateText(text);
    await translator.close();
    return result;
  }
}
