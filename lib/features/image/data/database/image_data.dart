
import 'dart:io';
import '../../../../core/services/image_service.dart';
import '../../../../core/services/translation_service.dart';
import '../../../../core/services/image_picker_service.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';

class ImageData {
  final ImageService ocrService = ImageService.instance;
  final ImagePickerService imagePickerService = ImagePickerService.instance;
  TranslationService translationService = TranslationService();

  // Pick image
  Future<File?> pickImageFromGallery() async {
    return await imagePickerService.pickImageFromGallery();
  }

  Future<File?> pickImageFromCamera() async {
    return await imagePickerService.pickImageFromCamera();
  }

  // Process image with OCR
  Future<({String text, String translatedText})> processImage({required File image ,required TranslateLanguage sourceLanguage , required TranslateLanguage targetLanguage }) async {
    var ocrText = await ocrService.processImage(image);
    final translated = await TranslationService.translate(
          text: ocrText,
          source: sourceLanguage,
          target: targetLanguage,
        );
    return (text: ocrText, translatedText: translated);
  }
}
