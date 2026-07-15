import '../../../../core/services/audio_service.dart';

class AudioData {
  final AudioService audioService;
  AudioData({required this.audioService});

  Future<bool> init() async {
    return await audioService.init();
  }

  Future<void> start({
    required SpeechResultCallback onResult,
  }) async {
    await audioService.start(onResult: onResult);
  }

  Future<void> stop() async {
    await audioService.stop();
  }

  Future<void> cancel() async {
    await audioService.cancel();
  }

}
