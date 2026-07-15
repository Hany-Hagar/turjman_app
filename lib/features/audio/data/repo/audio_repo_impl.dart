
import 'audio_repo.dart';
import 'package:dartz/dartz.dart';
import '../database/audio_data.dart';
import '../../../../core/services/audio_service.dart';

class AudioRepoImpl implements AudioRepo {
   final AudioData audioData;

   AudioRepoImpl({required this.audioData});

   @override
   Future<Either<Exception, bool>> init() async {
     try {
       await audioData.init();
       return Right(true);
     } catch (e) {
       return Left(Exception('Failed to initialize audio data: $e'));
     }
   }

   @override
   Future<Either<Exception, void>> start({
     required SpeechResultCallback onResult,
   }) async {
     try {
       await audioData.start(onResult: onResult);
       return Right(null);
     } catch (e) {
       return Left(Exception('Failed to start listening: $e'));
     }
   }

   @override
   Future<Either<Exception, void>> end() async {
     try {
       await audioData.stop();
       return Right(null);
     } catch (e) {
       return Left(Exception('Failed to end listening: $e'));
     }
   }

   @override
   Future<Either<Exception, void>> cancel() async {
     try {
       await audioData.cancel();
       return Right(null);
     } catch (e) {
       return Left(Exception('Failed to cancel listening: $e'));
     }
   }
}