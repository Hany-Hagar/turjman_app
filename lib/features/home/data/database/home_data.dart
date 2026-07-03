import '../../../../core/services/translation_service.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';

class HomeData {
  final TranslationService translationService;
  HomeData({required this.translationService});

  List<TranslateLanguage> getSupportedLanguages() {
    return TranslationService.supportedLanguages;
  }

  Future<String> translateText({
    required String text,
    required TranslateLanguage source,
    required TranslateLanguage target,
  }) async {
    return await TranslationService.translate(
      text: text,
      source: source,
      target: target,
    );
  }
}
