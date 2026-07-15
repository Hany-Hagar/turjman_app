import '../../../../core/services/audio_service.dart';

class AudioData {
  final AudioService audioService;
  AudioData({required this.audioService});

  void initAudio() {
    try {
      audioService.initSpeech();
    } catch (e) {
      rethrow;
    }
  }

  void startListening({
    Function(String words)? onResult,
    SpeechResultCallback? onSpeechResult,
  }) {
    try {
      audioService.startListening(
        onResult: onResult,
        onSpeechResult: onSpeechResult,
      );
    } catch (e) {
      rethrow;
    }
  }

  void stopListening() {
    try {
      audioService.stopListening();
    } catch (e) {
      rethrow;
    }
  }
}
