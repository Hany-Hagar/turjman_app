sealed class OfflineLanguagesStates {}

class OfflineLanguagesInitial extends OfflineLanguagesStates {}

// Get Languages States
class OfflineLanguagesLoading extends OfflineLanguagesStates {}

class OfflineLanguagesLoaded extends OfflineLanguagesStates {}

class OfflineLanguagesFailure extends OfflineLanguagesStates {
  final String message;
  OfflineLanguagesFailure({required this.message});
}

// Download Language States
class DownloadLanguageLoading extends OfflineLanguagesStates {
  final String languageId;
  DownloadLanguageLoading({required this.languageId});
}

class DownloadLanguageSuccess extends OfflineLanguagesStates {}

class DownloadLanguageFailure extends OfflineLanguagesStates {
  final String message;
  DownloadLanguageFailure({required this.message});
}

// Delete Language States
class DeleteLanguageLoading extends OfflineLanguagesStates {
  final String languageId;
  DeleteLanguageLoading({required this.languageId});
}

class DeleteLanguageSuccess extends OfflineLanguagesStates {}

class DeleteLanguageFailure extends OfflineLanguagesStates {
  final String message;
  DeleteLanguageFailure({required this.message});
}
