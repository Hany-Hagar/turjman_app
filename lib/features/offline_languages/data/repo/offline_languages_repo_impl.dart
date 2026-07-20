import 'package:dartz/dartz.dart';
import 'offline_languages_repo.dart';
import '../database/offline_languages_data.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';

class OfflineLanguagesRepoImpl extends OfflineLanguagesRepo {
  final OfflineLanguagesData offlineLanguagesData;

  OfflineLanguagesRepoImpl({required this.offlineLanguagesData});

  @override
  Future<
    Either<
      Exception,
      ({
        List<TranslateLanguage> downloaded,
        List<TranslateLanguage> notDownloaded,
      })
    >
  >
  getLanguages() async {
    try {
      final languages = await offlineLanguagesData.getDownloadedLanguages();
      return Right(languages);
    } catch (e) {
      return Left(Exception('Failed to get languages: $e'));
    }
  }

  @override
  Future<Either<Exception, void>> downloadLanguage(
    TranslateLanguage language,
  ) async {
    try {
      await offlineLanguagesData.downloadLanguage(language);
      return Right(null);
    } catch (e) {
      return Left(Exception('Failed to download language: $e'));
    }
  }

  @override
  Future<Either<Exception, void>> deleteLanguage(
    TranslateLanguage language,
  ) async {
    try {
      await offlineLanguagesData.deleteLanguage(language);
      return Right(null);
    } catch (e) {
      return Left(Exception('Failed to delete language: $e'));
    }
  }
}
