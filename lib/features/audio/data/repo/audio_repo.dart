import 'package:dartz/dartz.dart';
import '../../../../core/services/audio_service.dart';

abstract class AudioRepo {
  Future<Either<Exception, bool>> init();

  Future<Either<Exception, void>> toggle({
    required SpeechResultCallback onResult,
  });
}