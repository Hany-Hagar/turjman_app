import 'audio_states.dart';
import 'package:flutter/material.dart';
import '../../data/repo/audio_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/server_locator.dart';
import '../../../../core/enum/translation_type.dart';
import '../../../home/presentation/manager/home_cubit.dart';
import '../../../translations/data/models/translation_model.dart';
import '../../../../core/extension/translate_language_extension.dart';
import '../../../translations/presentation/manager/translations_cubit.dart';

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
    var sourceLang = getIt<HomeCubit>().selectedSourceLanguage;
    var targetLang = getIt<HomeCubit>().selectedTargetLanguage;

    final result = await audioRepo.toggle(
      source: sourceLang.toTranslateLanguage,
      target: targetLang.toTranslateLanguage,
      onResult: (source, translated, isFinal) {
        sourceText = source;
        translateText = translated;
        if (isFinal) {
          isListening = false;
          getIt<TranslationsCubit>().addTranslation(
            translation: TranslationModel.newTranslation(
              source: sourceLang,
              target: targetLang,
              sourceText: source,
              translatedText: translated,
              translationType: TranslationType.audio,
            ),
          );
        }
        emit(ListeningAudio(sourceText: source, translatedText: translated));
      },
    );

    result.fold((exception) {
      isListening = false;
      emit(ListeningAudioFailure(errorMessage: exception.toString()));
    }, (_) {});
  }
}
