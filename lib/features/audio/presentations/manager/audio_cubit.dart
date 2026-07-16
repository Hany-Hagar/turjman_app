import 'audio_states.dart';
import 'package:flutter/material.dart';
import '../../data/repo/audio_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AudioCubit extends Cubit<AudioStates> {
  final AudioRepo audioRepo;
  AudioCubit({required this.audioRepo}) : super(AudioInitial());
  static AudioCubit get(BuildContext context) => BlocProvider.of(context);

  bool isListening = false;
  String sourceText = '';
  String translateText = '';

  Future<void> initialize() async {
    isListening = false;
    sourceText = '';
    translateText = '';
    emit(InitializingAudioLoading());
    final result = await audioRepo.init();
    result.fold(
      (exception) =>
          emit(InitializingAudioFailure(errorMessage: exception.toString())),
      (_) => emit(InitializingAudioSuccess()),
    );
  }

  Future<void> toggleListening() async {
    isListening = !isListening;
    emit(ListeningAudioLoading());
    final result = await audioRepo.toggle(
      onResult: (recognizedText, isFinal) {
        sourceText = recognizedText;
        emit(ListeningAudioSuccess(recognizedText));
        if (isFinal) isListening = false;
      },
    );
    result.fold((exception) {
      isListening = !isListening;
      emit(ListeningAudioFailure(errorMessage: exception.toString()));
    }, (_) {});
  }
}
