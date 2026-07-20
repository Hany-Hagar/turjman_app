import '../../../../core/services/translation_service.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';

class OfflineLanguagesData {
  TranslationService translationService = TranslationService();

  // Get download and all languages
  Future<
    ({
      List<TranslateLanguage> downloaded,
      List<TranslateLanguage> notDownloaded,
    })
  >
  getDownloadedLanguages() async {
    return await TranslationService.getLanguages();
  }

  // Download a language
  Future<void> downloadLanguage(TranslateLanguage language) async {
    await TranslationService.downloadLanguage(language);
  }

  // Delete a language
  Future<void> deleteLanguage(TranslateLanguage language) async {
    await TranslationService.deleteLanguage(language);
  }
}
