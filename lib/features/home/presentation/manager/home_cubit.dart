import 'home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  var selectedSourceLanguage = 'English';
  var selectedTargetLanguage = 'English';
  List<String> sourceLanguages = ['English', 'Spanish', 'French'];
  List<String> targetLanguages = ['English', 'Spanish', 'French'];

  void changeSourceLanguage(String? language) {
    if (language == null) return;
    selectedSourceLanguage = language;
    emit(ChangeSourceLanguageState());
  }

  void changeTargetLanguage(String? language) {
    if (language == null) return;
    selectedTargetLanguage = language;
    emit(ChangeTargetLanguageState());
  }

  void swapLanguages() {
    final temp = selectedSourceLanguage;
    selectedSourceLanguage = selectedTargetLanguage;
    selectedTargetLanguage = temp;
    emit(SwapLanguagesState());
  }

  String targetText = '';
  bool isTranslating = false;
  TextEditingController sourceTextController = TextEditingController();

  void onSourceTextChanged(String? text) {
    if (text == null) return;
    targetText = text; // For demonstration, we just copy the source text to target text
    if (text.isEmpty) {
      isTranslating = false;
    } else {
      isTranslating = true;
    }
    emit(SourceTextChanged());
  }
}
