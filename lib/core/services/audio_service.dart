import 'dart:developer';

import 'package:speech_to_text/speech_to_text.dart';

typedef SpeechResultCallback = void Function(
  String words,
  bool isFinal,
);

class AudioService {
  AudioService._internal();

  static final AudioService _instance = AudioService._internal();

  factory AudioService() => _instance;

  final SpeechToText _speech = SpeechToText();

  bool _initialized = false;

  bool get isListening => _speech.isListening;

  Future<bool> init() async {
    if (_initialized) return true;

    try {
      _initialized = await _speech.initialize(
        onStatus: (status) {
          log('Speech Status: $status');
        },
        onError: (error) {
          log(
            'Speech Error: ${error.errorMsg} '
            '(permanent: ${error.permanent})',
          );
        },
      );

      if (_initialized) {
        final locales = await _speech.locales();
        final systemLocale = await _speech.systemLocale();

        log('Locales: ${locales.length}');
        log('System Locale: ${systemLocale?.localeId}');
      }
    } catch (e, s) {
      log(
        'Speech initialize error',
        error: e,
        stackTrace: s,
      );
      _initialized = false;
    }

    return _initialized;
  }

  Future<void> toggle({
    required SpeechResultCallback onResult,
  }) async {
    final ready = await init();

    if (!ready) return;

    if (_speech.isListening) {
      await _speech.stop();
      return;
    }
    final started = await _speech.listen(
      listenOptions: SpeechListenOptions(
        listenMode: ListenMode.dictation,
        partialResults: true,
        cancelOnError: false,
        pauseFor: const Duration(seconds: 8),
        listenFor: const Duration(minutes: 10),
      ),
      onResult: (result) {
        log(
          'WORDS: "${result.recognizedWords}" '
          'final=${result.finalResult}',
        );

        onResult(
          result.recognizedWords,
          result.finalResult,
        );
      },
    );

    log('Listening Started: $started');
  }
}