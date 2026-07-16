import 'package:google_mlkit_translation/google_mlkit_translation.dart';

extension LanguageNameExtension on String {
  TranslateLanguage? get translateLanguage {
    try {
      return TranslateLanguage.values.firstWhere(
        (e) =>
            e.bcpCode.toLowerCase() == toLowerCase() ||
            e.name.toLowerCase() == toLowerCase(),
      );
    } catch (_) {
      return null;
    }
  }

  String? get languageCode => translateLanguage?.bcpCode;
}
