import 'translations_repo.dart';
import 'package:dartz/dartz.dart';
import '../models/translation_model.dart';
import '../database/translations_data.dart';

class TranslationsRepoImpl extends TranslationsRepo {
  final TranslationsData _translationsData;
  TranslationsRepoImpl({required TranslationsData translationsData})
    : _translationsData = translationsData;

  @override
  Future<Either<Exception, List<TranslationModel>>> fetchTranslations() async {
    try {
      final translations = _translationsData.fetchTranslations();
      return Right(translations);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, void>> addTranslation(
    TranslationModel translation,
  ) async {
    try {
      await _translationsData.addTranslation(translation);
      return Right(null);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, void>> deleteTranslation(String id) async {
    try {
      await _translationsData.deleteTranslation(id);
      return Right(null);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
