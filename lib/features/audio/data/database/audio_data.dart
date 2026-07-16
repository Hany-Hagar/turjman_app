import '../../../../core/services/audio_service.dart';

class AudioData {
  final AudioService audioService;

  AudioData({
    required this.audioService,
  });

  Future<bool> init() {
    return audioService.init();
  }

  Future<void> toggle({
    required SpeechResultCallback onResult,
  }) {
    return audioService.toggle(
      onResult: onResult,
    );
  }

  bool get isListening => audioService.isListening;
}