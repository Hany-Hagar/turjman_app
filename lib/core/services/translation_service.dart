import 'package:google_mlkit_translation/google_mlkit_translation.dart';

class TranslationService {
  TranslationService();

  static final OnDeviceTranslatorModelManager _modelManager =
      OnDeviceTranslatorModelManager();

  static List<TranslateLanguage> get supportedLanguages =>
      TranslateLanguage.values;

  static Future<void> downloadLanguage(TranslateLanguage language) async {
    await _modelManager.downloadModel(language.bcpCode);
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
