import 'package:flutter/material.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';
import '../../data/repo/offline_languages_repo.dart';
import 'offline_languages_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OfflineLanguagesCubit extends Cubit<OfflineLanguagesStates> {
  final OfflineLanguagesRepo offlineLanguagesRepo;
  OfflineLanguagesCubit({required this.offlineLanguagesRepo})
    : super(OfflineLanguagesInitial());
  static OfflineLanguagesCubit get(BuildContext context) =>
      BlocProvider.of(context);

  List<TranslateLanguage> otherLanguages = [];
  List<TranslateLanguage> downloadedLanguages = [];

  // Get Languages
  void getLanguages() async {
    emit(OfflineLanguagesLoading());
    var result = await offlineLanguagesRepo.getLanguages();
    result.fold(
      (failure) => emit(OfflineLanguagesFailure(message: failure.toString())),
      (languages) {
        downloadedLanguages = languages.downloaded;
        otherLanguages = languages.notDownloaded;
        emit(OfflineLanguagesLoaded());
      },
    );
  }

  // Download Language
  void downloadLanguage({required TranslateLanguage language}) async {
    emit(DownloadLanguageLoading(languageId: language.bcpCode));
    var result = await offlineLanguagesRepo.downloadLanguage(language);
    result.fold(
      (failure) => emit(DownloadLanguageFailure(message: failure.toString())),
      (_) {
        downloadedLanguages.add(language);
        otherLanguages.remove(language);
        emit(DownloadLanguageSuccess());
      },
    );
  }

  // Delete Language
  void deleteLanguage({required TranslateLanguage language}) async {
    emit(DeleteLanguageLoading(languageId: language.bcpCode));
    var result = await offlineLanguagesRepo.deleteLanguage(language);
    result.fold(
      (failure) => emit(DeleteLanguageFailure(message: failure.toString())),
      (_) {
        downloadedLanguages.remove(language);
        otherLanguages.add(language);
        emit(DeleteLanguageSuccess());
      },
    );
  }
}
