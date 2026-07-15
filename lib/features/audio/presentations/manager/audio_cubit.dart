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

  void initialize() {
    isListening = false;
    sourceText = '';
    emit(AudioInitial());
  }

  Future<void> startListening() async {
    isListening = true;
    emit(AudioLoading());
    final result = await audioRepo.start(
      onResult: (recognizedText, isFinal) {
        sourceText = recognizedText;
        emit(AudioSuccess(recognizedText));
        if (isFinal) isListening = false;
      },
    );
    result.fold((exception) {
      isListening = false;
      emit(AudioFailure(errorMessage: exception.toString()));
    }, (_) {});
  }

  Future<void> endListening() async {
    if (!isListening) return;
    isListening = false;
    emit(AudioLoading());
    final result = await audioRepo.end();
    result.fold(
      (exception) => emit(AudioFailure(errorMessage: exception.toString())),
      (_) => emit(StoppedListening()),
    );
  }

  Future<void> cancelListening() async {
    if (!isListening) return;
    isListening = false;
    emit(AudioLoading());
    final result = await audioRepo.cancel();
    result.fold(
      (exception) => emit(AudioFailure(errorMessage: exception.toString())),
      (_) => emit(AudioInitial()),
    );
  }
}
