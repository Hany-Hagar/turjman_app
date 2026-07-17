import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../core/services/ocr_service.dart';

abstract class ImageRepo {
  Future<Either<Exception, File?>> pickImageFromGallery();
  Future<Either<Exception, OcrResult>> processImage(File imageFile);
}

