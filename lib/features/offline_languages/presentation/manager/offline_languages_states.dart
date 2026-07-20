sealed class OfflineLanguagesState {}

class OfflineLanguagesInitial extends OfflineLanguagesState {}

// Get Languages States
class OfflineLanguagesLoading extends OfflineLanguagesState {}

class OfflineLanguagesLoaded extends OfflineLanguagesState {}

class OfflineLanguagesFailure extends OfflineLanguagesState {
  final String message;
  OfflineLanguagesFailure({required this.message});
}

// Download Language States
class DownloadLanguageLoading extends OfflineLanguagesState {
  final String languageId;
  DownloadLanguageLoading({required this.languageId});
}

class DownloadLanguageSuccess extends OfflineLanguagesState {}

class DownloadLanguageFailure extends OfflineLanguagesState {
  final String message;
  DownloadLanguageFailure({required this.message});
}

// Delete Language States
class DeleteLanguageLoading extends OfflineLanguagesState {
  final String languageId;
  DeleteLanguageLoading({required this.languageId});
}

class DeleteLanguageSuccess extends OfflineLanguagesState {}

class DeleteLanguageFailure extends OfflineLanguagesState {
  final String message;
  DeleteLanguageFailure({required this.message});
}
