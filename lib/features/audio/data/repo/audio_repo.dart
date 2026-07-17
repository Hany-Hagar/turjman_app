import 'package:dartz/dartz.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';

abstract class AudioRepo {
  Future<Either<Exception, bool>> init();

  Future<Either<Exception, void>> toggle({
    required TranslateLanguage source,
    required TranslateLanguage target,
    required void Function(
      String sourceText,
      String translatedText,
      bool isFinal,
    ) onResult,
  });
}