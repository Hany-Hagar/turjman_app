import 'dart:io';
import 'image_repo.dart';
import 'package:dartz/dartz.dart';
import '../database/image_data.dart';
import '../../../../core/services/image_service.dart';

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
  Future<Either<Exception, OcrResult>> processImage(File imageFile) async {
    try {
      final OcrResult ocrResult = await imageData.processImage(imageFile);
      return Right(ocrResult);
    } catch (e) {
      return Left(Exception('Failed to process image: $e'));
    }
  }
}
