import 'audio_repo.dart';
import 'package:dartz/dartz.dart';
import '../database/audio_data.dart';
import '../../../../core/services/audio_service.dart';

class AudioRepoImpl extends AudioRepo {
  final AudioData audioData;

  AudioRepoImpl({required this.audioData});

  @override
  Future<Either<Exception, void>> initAudio() async {
    try {
      audioData.initAudio();
      return const Right(null);
    } catch (e) {
      return Left(Exception('Failed to initialize audio: $e'));
    }
  }

  @override
  Future<Either<Exception, void>> startListening({
    Function(String words)? onResult,
    SpeechResultCallback? onSpeechResult,
  }) async {
    try {
      audioData.startListening(
        onResult: onResult,
        onSpeechResult: onSpeechResult,
      );
      return const Right(null);
    } catch (e) {
      return Left(Exception('Failed to start listening: $e'));
    }
  }

  @override
  Future<Either<Exception, void>> stopListening() async {
    try {
      audioData.stopListening();
      return const Right(null);
    } catch (e) {
      return Left(Exception('Failed to stop listening: $e'));
    }
  }
}