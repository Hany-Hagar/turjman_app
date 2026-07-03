sealed class HomeStates {}

class HomeInitial extends HomeStates {}

class GetSupportedLanguagesLoadingState extends HomeStates {}

class GetSupportedLanguagesSuccessState extends HomeStates {}

class GetSupportedLanguagesErrorState extends HomeStates {
  final String errorMessage;
  GetSupportedLanguagesErrorState(this.errorMessage);
}

class SwapLanguagesState extends HomeStates {}

class ChangeSourceLanguageState extends HomeStates {}

class ChangeTargetLanguageState extends HomeStates {}

class SourceTextChanged extends HomeStates {}


class TranslateTextLoadingState extends HomeStates {}

class TranslateTextSuccessState extends HomeStates {}

class TranslateTextErrorState extends HomeStates {
  final String errorMessage;
  TranslateTextErrorState(this.errorMessage);
}

