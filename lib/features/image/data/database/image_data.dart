import 'dart:io';
import '../../../../core/services/image_service.dart';
import '../../../../core/services/image_picker_service.dart';

class ImageData {
  final ImageService ocrService = ImageService.instance;
  final ImagePickerService imagePickerService = ImagePickerService.instance;

  // Pick image
  Future<File?> pickImageFromGallery() async {
    return await imagePickerService.pickImageFromGallery();
  }

  Future<File?> pickImageFromCamera() async {
    return await imagePickerService.pickImageFromCamera();
  }

  // Process image with OCR
  Future<OcrResult> processImage(File imageFile) async {
    return await ocrService.processImage(imageFile);
  }
}
