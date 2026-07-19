import '../../../settings/presentation/manager/settings_cubit.dart';
import 'home_states.dart';
import 'package:flutter/material.dart';
import '../../data/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/server_locator.dart';
import 'package:turjman_app/core/enum/translation_type.dart';
import '../../../translations/data/models/translation_model.dart';
import '../../../translations/presentation/manager/translations_cubit.dart';

class HomeCubit extends Cubit<HomeStates> {
  final HomeRepo homeRepo;
  HomeCubit({required this.homeRepo}) : super(HomeInitial());
  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  String selectedSourceLanguage = '';
  String selectedTargetLanguage = '';
  List<String> sourceLanguages = [];
  List<String> targetLanguages = [];

  // Get supported languages
  Future<void> getSupportedLanguages() async {
    emit(GetSupportedLanguagesLoadingState());
    final result = await homeRepo.getLanguages();
    result.fold(
      (exception) =>
          emit(GetSupportedLanguagesErrorState(exception.toString())),
      (languages) {
        sourceLanguages = languages;
        targetLanguages = languages;
        if (languages.isNotEmpty) {
          selectedSourceLanguage = getIt<SettingsCubit>().state.sourceLanguage;
          selectedTargetLanguage = getIt<SettingsCubit>().state.targetLanguage;
        }
        emit(GetSupportedLanguagesSuccessState());
      },
    );
  }

  void changeSourceLanguage(String? language) {
    if (language == null) return;
    selectedSourceLanguage = language;
    getIt<SettingsCubit>().updateSourceLanguage(language);
    emit(ChangeSourceLanguageState());
  }

  void changeTargetLanguage(String? language) {
    if (language == null) return;
    selectedTargetLanguage = language;
    getIt<SettingsCubit>().updateTargetLanguage(language);
    emit(ChangeTargetLanguageState());
  }

  void swapLanguages() {
    final temp = selectedSourceLanguage;
    selectedSourceLanguage = selectedTargetLanguage;
    selectedTargetLanguage = temp;
    getIt<SettingsCubit>().updateSourceLanguage(selectedSourceLanguage);
    getIt<SettingsCubit>().updateTargetLanguage(selectedTargetLanguage);
    emit(SwapLanguagesState());
  }

  String targetText = '';
  bool isTranslating = false;
  TextEditingController sourceTextController = TextEditingController();

  Future<void> onSourceTextChanged(String? text) async {
    if (text == null) return;
    if (text.isEmpty) {
      isTranslating = false;
      emit(SourceTextChanged());
    } else {
      isTranslating = true;
      await _translateText(text: text);
    }
  }

  Future<void> _translateText({required String text}) async {
    emit(TranslateTextLoadingState());
    final result = await homeRepo.translateText(
      text: text,
      sourceLanguage: selectedSourceLanguage,
      targetLanguage: selectedTargetLanguage,
    );
    result.fold(
      (exception) => emit(TranslateTextErrorState(exception.toString())),
      (translatedText) {
        targetText = translatedText;
        getIt<TranslationsCubit>().addTranslation(
          translation: TranslationModel.newTranslation(
            source: selectedSourceLanguage,
            target: selectedTargetLanguage,
            sourceText: text,
            translatedText: translatedText,
            translationType: TranslationType.text,
          ),
        );
        emit(TranslateTextSuccessState());
      },
    );
  }
}
