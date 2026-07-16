import 'package:dartz/dartz.dart';

import '../../../../core/services/audio_service.dart';
import '../database/audio_data.dart';
import 'audio_repo.dart';

class AudioRepoImpl implements AudioRepo {
  final AudioData audioData;

  AudioRepoImpl({
    required this.audioData,
  });

  @override
  Future<Either<Exception, bool>> init() async {
    try {
      final result = await audioData.init();
      return Right(result);
    } catch (e) {
      return Left(
        Exception('Failed to initialize audio service: $e'),
      );
    }
  }

  @override
  Future<Either<Exception, void>> toggle({
    required SpeechResultCallback onResult,
  }) async {
    try {
      await audioData.toggle(
        onResult: onResult,
      );
      return const Right(null);
    } catch (e) {
      return Left(
        Exception('Failed to toggle listening: $e'),
      );
    }
  }
}