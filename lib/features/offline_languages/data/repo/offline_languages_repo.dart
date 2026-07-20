import 'package:dartz/dartz.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';

abstract class OfflineLanguagesRepo {
  Future<
    Either<Exception, ({List<TranslateLanguage> downloaded, List<TranslateLanguage> notDownloaded})>
  >
  getLanguages();

  Future<Either<Exception, void>> downloadLanguage(TranslateLanguage language);

  Future<Either<Exception, void>> deleteLanguage(TranslateLanguage language);
}
