import 'dart:async';
import 'dart:developer';
import 'package:speech_to_text/speech_to_text.dart';

typedef SpeechResultCallback = void Function(String words, bool isFinal);

class AudioService {
  static final AudioService _instance = AudioService._internal();
  factory AudioService() => _instance;
  AudioService._internal();

  final SpeechToText _speech = SpeechToText();
  bool _isInitialized = false;

  bool get isListening => _speech.isListening;
  bool get isAvailable => _isInitialized;

  /// Initializes the speech recognition service.
  Future<bool> initSpeech() async {
    if (_isInitialized) return true;

    try {
      _isInitialized = await _speech.initialize();
    } catch (e) {
      _isInitialized = false;
      log("Speech initialization failed: $e");
    }
    return _isInitialized;
  }

  /// Starts listening for speech input and returns the recognized text via the onResult callback.
  Future<void> startListening({
    Function(String words)? onResult,
    SpeechResultCallback? onSpeechResult,
  }) async {
    if (!_isInitialized) {
      log("AudioService not initialized. Call initAudio() first.");
      return;
    }
    if (onResult == null && onSpeechResult == null) {
      log("AudioService has no result callback.");
      return;
    }

    await _speech.listen(
      listenOptions: SpeechListenOptions(
        cancelOnError: false,
        partialResults: true,
        listenMode: ListenMode.dictation,
        pauseFor: const Duration(seconds: 8),
        listenFor: const Duration(minutes: 10),
      ),
      onResult: (result) {
        if (onSpeechResult != null) {
          onSpeechResult(result.recognizedWords, result.finalResult);
        } else {
          onResult?.call(result.recognizedWords);
        }
      },
    );
  }

  /// Stops the current listening session and processes final results.
  Future<void> stopListening() async {
    if (_speech.isListening) {
      await _speech.stop();
    }
  }

  /// Cancels the current listening session and discards results.
  Future<void> cancelListening() async {
    if (_speech.isListening) {
      await _speech.cancel();
    }
  }
}
