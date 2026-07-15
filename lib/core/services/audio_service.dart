// ignore_for_file: deprecated_member_use
import 'dart:developer';
import 'package:speech_to_text/speech_to_text.dart';

typedef SpeechResultCallback = void Function(String words, bool isFinal);

class AudioService {
  static final AudioService _instance = AudioService._internal();
  factory AudioService() => _instance;
  AudioService._internal();

  final SpeechToText _speech = SpeechToText();

  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;
  bool get isListening => _speech.isListening;

  Future<bool> init() async {
    if (_isInitialized) return true;

    try {
      _isInitialized = await _speech.initialize();
    } catch (e) {
      _isInitialized = false;
      log("Speech initialization failed: $e");
    }

    return _isInitialized;
  }

  Future<void> start({
    required SpeechResultCallback onResult,
  }) async {
    if (!_isInitialized) {
      log("SpeechService not initialized. Call init() first.");
      return;
    }

    if (_speech.isListening) return;

    await _speech.listen(
      listenMode: ListenMode.dictation,
      partialResults: true,
      cancelOnError: false,
      pauseFor: const Duration(seconds: 8),
      listenFor: const Duration(minutes: 10),
      onResult: (result) {
        onResult(result.recognizedWords, result.finalResult);
      },
    );
  }

  Future<void> stop() async {
    if (_speech.isListening) {
      await _speech.stop();
    }
  }

  Future<void> cancel() async {
    if (_speech.isListening) {
      await _speech.cancel();
    }
  }
}
