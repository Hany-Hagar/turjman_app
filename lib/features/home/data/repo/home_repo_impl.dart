
import 'home_repo.dart';
import 'package:dartz/dartz.dart';
import '../database/home_data.dart';
import '../../../../core/extension/translate_language_extension.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeData homeData;
  HomeRepoImpl({required this.homeData});

  @override
  Future<Either<Exception, List<String>>> getLanguages() async {
    try {
      final languages = homeData
          .getSupportedLanguages()
          .map((language) => language.name)
          .toList();
      return Right(languages);
    } catch (e) {
      return Left(Exception('Failed to fetch languages: $e'));
    }
  }

  @override
  Future<Either<Exception, String>> translateText({
    required String text,
    required String sourceLanguage,
    required String targetLanguage,
  }) async {
    try {
      final translatedText = await homeData.translateText(
        text: text,
        source: sourceLanguage.toTranslateLanguage,
        target: targetLanguage.toTranslateLanguage,
      );
      return Right(translatedText);
    } catch (e) {
      return Left(Exception('Failed to translate text: $e'));
    }
  }
}
