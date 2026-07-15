import 'translations_states.dart';
import 'package:flutter/material.dart';
import '../../data/repo/translations_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/translation_model.dart';

class TranslationsCubit extends Cubit<TranslationsStates> {
  final TranslationsRepo translationsRepo;

  TranslationsCubit({required this.translationsRepo})
    : super(TranslationsInitialState());

  static TranslationsCubit get(BuildContext context) =>
      BlocProvider.of(context);

  List<TranslationModel> translations = [];
  List<TranslationModel> recentTranslations = [];

  void _setTranslations(List<TranslationModel> translations) {
    this.translations = translations;
    recentTranslations = translations.take(5).toList();
  }

  Future<void> fetchTranslations() async {
    emit(FetchTranslationsLoadingState());
    final result = await translationsRepo.fetchTranslations();
    result.fold(
      (error) =>
          emit(FetchTranslationsErrorState(errorMessage: error.toString())),
      (translations) {
        _setTranslations(translations);
        emit(FetchTranslationsSuccessState());
      },
    );
  }

  Future<void> addTranslation(TranslationModel translation) async {
    emit(AddTranslationLoadingState());
    final result = await translationsRepo.addTranslation(translation);
    result.fold(
      (error) => emit(AddTranslationErrorState(errorMessage: error.toString())),
      (_) {
        _setTranslations([translation, ...translations]);
        emit(AddTranslationSuccessState());
      },
    );
  }

  Future<void> deleteTranslation(String id) async {
    emit(DeleteTranslationLoadingState());
    final result = await translationsRepo.deleteTranslation(id);
    result.fold(
      (error) =>
          emit(DeleteTranslationErrorState(errorMessage: error.toString())),
      (_) {
        _setTranslations(
          translations.where((translation) => translation.id != id).toList(),
        );
        emit(DeleteTranslationSuccessState());
      },
    );
  }
}
