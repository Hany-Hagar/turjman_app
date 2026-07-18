import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../core/services/image_service.dart';

abstract class ImageRepo {
  Future<Either<Exception, File?>> pickImage({required bool fromCamera});

  Future<Either<Exception, OcrResult>> processImage(File imageFile);
}
