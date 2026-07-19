import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';

abstract class ImageRepo {
  Future<Either<Exception, File?>> pickImage({required bool fromCamera});

  Future<Either<Exception, ({String text, String translatedText})>> processImage({required File imageFile, required TranslateLanguage sourceLanguage, required TranslateLanguage targetLanguage});
}
