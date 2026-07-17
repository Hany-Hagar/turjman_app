import 'audio_states.dart';
import 'package:flutter/material.dart';
import '../../data/repo/audio_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/server_locator.dart';
import '../../../home/presentation/manager/home_cubit.dart';
import '../../../../core/extension/translate_language_extension.dart';

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
      source: getIt<HomeCubit>().selectedSourceLanguage.toTranslateLanguage,
      target: getIt<HomeCubit>().selectedTargetLanguage.toTranslateLanguage,
      onResult: (source, translated, isFinal) {
        sourceText = source;
        translateText = translated;
        emit(ListeningAudio(sourceText: source, translatedText: translated));
        if (isFinal) {
          isListening = false;
        }
      },
    );

    result.fold((exception) {
      isListening = false;
      emit(ListeningAudioFailure(errorMessage: exception.toString()));
    }, (_) {});
  }
}
