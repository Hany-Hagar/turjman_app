sealed class TranslationsStates {}

class TranslationsInitialState extends TranslationsStates {}

class FetchTranslationsLoadingState extends TranslationsStates {}

class FetchTranslationsSuccessState extends TranslationsStates {}

class FetchTranslationsErrorState extends TranslationsStates {
  final String errorMessage;

  FetchTranslationsErrorState({required this.errorMessage});
}

class AddTranslationLoadingState extends TranslationsStates {}

class AddTranslationSuccessState extends TranslationsStates {}

class AddTranslationErrorState extends TranslationsStates {
  final String errorMessage;

  AddTranslationErrorState({required this.errorMessage});
}

class DeleteTranslationLoadingState extends TranslationsStates {}

class DeleteTranslationSuccessState extends TranslationsStates {}

class DeleteTranslationErrorState extends TranslationsStates {
  final String errorMessage;

  DeleteTranslationErrorState({required this.errorMessage});
}
