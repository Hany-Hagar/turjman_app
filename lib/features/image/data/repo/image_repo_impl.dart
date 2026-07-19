
import 'dart:io';
import 'image_repo.dart';
import 'package:dartz/dartz.dart';
import '../database/image_data.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';

class ImageRepoImpl extends ImageRepo {
  final ImageData imageData;

  ImageRepoImpl({required this.imageData});

  @override
  Future<Either<Exception, File?>> pickImage({required bool fromCamera}) async {
    try {
      final File? imageFile = fromCamera
          ? await imageData.pickImageFromCamera()
          : await imageData.pickImageFromGallery();
      return Right(imageFile);
    } catch (e) {
      return Left(Exception('Failed to pick image: $e'));
    }
  }

  @override
  Future<Either<Exception, ({String text, String translatedText})>> processImage({required File imageFile, required TranslateLanguage sourceLanguage, required TranslateLanguage targetLanguage}) async {
    try {
      final ({String text, String translatedText}) ocrResult = await imageData.processImage(
        image: imageFile,
        sourceLanguage: sourceLanguage,
        targetLanguage: targetLanguage,
      );
      return Right(ocrResult);
    } catch (e) {
      return Left(Exception('Failed to process image: $e'));
    }
  }
}
