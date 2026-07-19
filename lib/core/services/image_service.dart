import 'dart:io';

import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class ImageService {
  ImageService._();

  static final ImageService instance = ImageService._();

  TextRecognizer? _recognizer;

  TextRecognizer get _textRecognizer =>
      _recognizer ??= TextRecognizer();

  Future<String> processImage(File imageFile) async {
    if (!Platform.isAndroid && !Platform.isIOS) {
      throw UnsupportedError(
        'OCR is only supported on Android and iOS.',
      );
    }

    final result = await _textRecognizer.processImage(
      InputImage.fromFile(imageFile),
    );

    return _cleanText(result.text);
  }

  String _cleanText(String text) {
    return text
        .replaceAll('\r\n', '\n')
        .split('\n')
        .map((line) => line.trimLeft())
        .where((line) => line.isNotEmpty)
        .join('\n')
        .replaceAll(RegExp(r'[ \t]+'), ' ')
        .trim();
  }

  Future<void> dispose() async {
    await _recognizer?.close();
    _recognizer = null;
  }
}