import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class ImageService {
  ImageService._();
  static final ImageService instance = ImageService._();
  final TextRecognizer _recognizer = TextRecognizer();
  Future<OcrResult> processImage(File imageFile) async {
    final inputImage = InputImage.fromFile(imageFile);
    final recognizedText = await _recognizer.processImage(inputImage);
    final imageSize = await _getImageSize(imageFile);
    final lines = <OcrLine>[];
    for (final block in recognizedText.blocks) {
      for (final line in block.lines) {
        lines.add(
          OcrLine(
            text: line.text,
            boundingBox: line.boundingBox,
            cornerPoints: line.cornerPoints
                .map((e) => Offset(e.x.toDouble(), e.y.toDouble()))
                .toList(),
          ),
        );
      }
    }
    return OcrResult(imageSize: imageSize, lines: lines);
  }

  Future<Size> _getImageSize(File file) async {
    final bytes = await file.readAsBytes();
    final codec = await ui.instantiateImageCodec(bytes);
    final frame = await codec.getNextFrame();
    return Size(frame.image.width.toDouble(), frame.image.height.toDouble());
  }

  Future<void> dispose() async {
    await _recognizer.close();
  }
}

class OcrResult {
  final Size imageSize;
  final List<OcrLine> lines;
  const OcrResult({required this.imageSize, required this.lines});
}

class OcrLine {
  final String text;
  final Rect boundingBox;
  final List<Offset> cornerPoints;
  const OcrLine({
    required this.text,
    required this.boundingBox,
    required this.cornerPoints,
  });
}
