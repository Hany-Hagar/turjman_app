import 'package:google_mlkit_translation/google_mlkit_translation.dart';

extension TranslateLanguageExtension on String {
  TranslateLanguage get toTranslateLanguage {
    for (final language in TranslateLanguage.values) {
      if (language.name == this) return language;
    }
    return TranslateLanguage.english;
  }
}
