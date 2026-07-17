import 'package:google_mlkit_translation/google_mlkit_translation.dart';

import '../../../../core/services/audio_service.dart';
import '../../../../core/services/translation_service.dart';

class AudioData {
  final AudioService audioService;
  AudioData({required this.audioService});
  TranslationService translationService = TranslationService();

  Future<bool> init() {
    return audioService.init();
  }

  Future<void> toggle({
    required TranslateLanguage source,
    required TranslateLanguage target,
    required void Function(
      String sourceText,
      String translatedText,
      bool isFinal,
    )
    onResult,
  }) {
    return audioService.toggle(
      onResult: (text, isFinal) async {
        final translated = await TranslationService.translate(
          text: text,
          source: source,
          target: target,
        );
        onResult(text, translated, isFinal);
      },
    );
  }

  bool get isListening => audioService.isListening;
}
