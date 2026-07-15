import 'dart:async';
import 'dart:developer';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_error.dart';

typedef SpeechResultCallback = void Function(String words, bool isFinal);

class SpeechService {
  static final SpeechService _instance = SpeechService._internal();
  factory SpeechService() => _instance;
  SpeechService._internal();

  final SpeechToText _speech = SpeechToText();
  bool _isInitialized = false;

  bool get isListening => _speech.isListening;
  bool get isAvailable => _isInitialized;

  /// Initializes the speech recognition service.
  Future<bool> initSpeech({
    Function(String status)? onStatus,
    Function(SpeechRecognitionError error)? onError,
  }) async {
    if (_isInitialized) return true;

    try {
      _isInitialized = await _speech.initialize(
        onStatus: (status) {
          if (onStatus != null) onStatus(status);
        },
        onError: (errorNotification) {
          if (onError != null) onError(errorNotification);
        },
      );
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
    String localeId = 'ar_EG',
  }) async {
    if (!_isInitialized) {
      log("SpeechService not initialized. Call initSpeech() first.");
      return;
    }
    if (onResult == null && onSpeechResult == null) {
      log("SpeechService has no result callback.");
      return;
    }

    await _speech.listen(
      listenOptions: SpeechListenOptions(
        localeId: localeId,
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
