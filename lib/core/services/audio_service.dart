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
  bool _shouldKeepListening = false;
  bool _isRestarting = false;

  Future<bool>? _initializing;
  SpeechResultCallback? _onResult;

  bool get isInitialized => _isInitialized;
  bool get isListening => _speech.isListening;

  Future<bool> init() async {
    if (_isInitialized) return true;

    if (_initializing != null) {
      return _initializing!;
    }

    _initializing = _initialize();

    final result = await _initializing!;
    _initializing = null;

    return result;
  }

  Future<bool> _initialize() async {
    try {
      _isInitialized = await _speech.initialize();
      return _isInitialized;
    } catch (e) {
      _isInitialized = false;
      log('Speech initialization failed: $e');
      return false;
    }
  }

  Future<void> start({required SpeechResultCallback onResult}) async {
    final initialized = await init();
    if (!initialized) return;
    _onResult = onResult;
    _shouldKeepListening = true;
    if (!_speech.isListening) {
      await _startListening();
    }
  }

  Future<void> _startListening() async {
    if (!_shouldKeepListening) return;
    if (_speech.isListening) return;
    if (_onResult == null) return;
    try {
      await _speech.listen(
        listenMode: ListenMode.dictation,
        partialResults: true,
        cancelOnError: false,
        pauseFor: const Duration(seconds: 8),
        listenFor: const Duration(minutes: 10),
        onResult: (result) {
          _onResult?.call(result.recognizedWords, result.finalResult);
        },
      );
      log('Speech listening started');
    } catch (e) {
      log('Speech listen failed: $e');
      _restartListening();
    }
  }

  Future<void> _restartListening() async {
    if (!_shouldKeepListening) return;
    if (_isRestarting) return;
    if (_speech.isListening) return;
    _isRestarting = true;
    try {
      // أقل وقت عملي لتجنب error_busy
      await Future.delayed(const Duration(milliseconds: 50));
      if (_shouldKeepListening && !_speech.isListening) {
        await _startListening();
      }
    } finally {
      _isRestarting = false;
    }
  }

  Future<void> stop() async {
    _shouldKeepListening = false;
    _isRestarting = false;
    if (_speech.isListening) {
      await _speech.stop();
    }
  }

  Future<void> cancel() async {
    _shouldKeepListening = false;
    _isRestarting = false;
    if (_speech.isListening) {
      await _speech.cancel();
    }
  }
}
