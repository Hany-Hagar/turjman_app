import 'package:dartz/dartz.dart';
import '../models/translation_model.dart';

abstract class TranslationsRepo {
  Future<Either<Exception, List<TranslationModel>>> fetchTranslations();

  Future<Either<Exception, void>> addTranslation(TranslationModel translation);

  Future<Either<Exception, void>> deleteTranslation(String id);
}