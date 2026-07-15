import 'package:dartz/dartz.dart';
import '../../../../core/services/audio_service.dart';

abstract class AudioRepo {

  Future<Either<Exception, void>> initAudio();

  Future<Either<Exception, void>> startListening({
    Function(String words)? onResult,
    SpeechResultCallback? onSpeechResult,
  });

  Future<Either<Exception, void>> stopListening();
}