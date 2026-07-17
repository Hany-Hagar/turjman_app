import 'dart:io';
import '../../../../core/services/ocr_service.dart';
import '../../../../core/services/image_picker_service.dart';

class ImageData {
  final OcrService ocrService = OcrService.instance;
  final ImagePickerService imagePickerService = ImagePickerService.instance;

  // Pick image
  Future<File?> pickImageFromGallery() async {
    return await imagePickerService.pickImageFromGallery();
  }

  // Process image with OCR
  Future<OcrResult> processImage(File imageFile) async {
    return await ocrService.processImage(imageFile);
  }
}
