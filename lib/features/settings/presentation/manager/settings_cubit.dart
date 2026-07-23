import 'package:flutter/material.dart';
import '../../models/app_user_pref.dart';
import '../../models/language_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class SettingsCubit extends HydratedCubit<AppUserPref> {
  SettingsCubit() : super(AppUserPref.standard());

  // ignore: strict_top_level_inference
  static SettingsCubit get(context) => BlocProvider.of<SettingsCubit>(context);

  // --- Functional Updates ---

  void updateLanguage(LanguageModel language) {
    emit(state.copyWith(lang: language.code, langIndex: language.index));
  }

  void updateTheme(ThemeMode theme) => emit(state.copyWith(theme: theme));

  void toggleFirstTimeUser() =>
      emit(state.copyWith(isFirstTime: !state.isFirstTime));

  void updateSourceLanguage(String sourceLanguage) =>
      emit(state.copyWith(sourceLanguage: sourceLanguage));

  void updateTargetLanguage(String targetLanguage) =>
      emit(state.copyWith(targetLanguage: targetLanguage));

  void toggleNotifications() =>
      emit(state.copyWith(notificationsEnabled: !state.notificationsEnabled));

  void toggleDownloadOverWiFiOnly() =>
      emit(state.copyWith(downloadOverWiFiOnly: !state.downloadOverWiFiOnly));

  @override
  AppUserPref? fromJson(Map<String, dynamic> json) {
    try {
      return AppUserPref.fromJson(json);
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(AppUserPref state) {
    try {
      return state.toJson();
    } catch (e) {
      return null;
    }
  }
}
