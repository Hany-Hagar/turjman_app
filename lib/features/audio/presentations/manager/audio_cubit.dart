import 'audio_states.dart';
import '../../data/repo/audio_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/audio_service.dart';

class AudioCubit extends Cubit<AudioStates> {
  final AudioRepo audioRepo;
  AudioCubit({required this.audioRepo}) : super(AudioInitialState());

  Future<void> initAudio() async {
    emit(AudioLoading());
    final result = await audioRepo.initAudio();
    result.fold(
      (exception) => emit(AudioFailure(message: exception.toString())),
      (_) => emit(AudioListening()),
    );
  }

  Future<void> startListening({
    Function(String words)? onResult,
    SpeechResultCallback? onSpeechResult,
  }) async {
    emit(AudioLoading());
    final result = await audioRepo.startListening(
      onResult: onResult,
      onSpeechResult: onSpeechResult,
    );
    result.fold(
      (exception) => emit(AudioFailure(message: exception.toString())),
      (_) => emit(AudioListening()),
    );
  }

  Future<void> stopListening() async {
    emit(AudioLoading());
    final result = await audioRepo.stopListening();
    result.fold(
      (exception) => emit(AudioFailure(message: exception.toString())),
      (_) => emit(AudioStopped()),
    );
  }
}
