import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Exception, List<String>>> getLanguages();
  Future<Either<Exception, String>> translateText({
    required String text,
    required String sourceLanguage,
    required String targetLanguage,
  });
}
