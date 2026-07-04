import 'translations_states.dart';
import '../../data/repo/translations_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/translation_model.dart';

class TranslationsCubit extends Cubit<TranslationsStates> {
  final TranslationsRepo translationsRepo;

  TranslationsCubit({required this.translationsRepo})
    : super(TranslationsInitialState());

  List<TranslationModel> translations = [];

  Future<void> fetchTranslations() async {
    emit(FetchTranslationsLoadingState());
    final result = await translationsRepo.fetchTranslations();
    result.fold(
      (error) =>
          emit(FetchTranslationsErrorState(errorMessage: error.toString())),
      (translations) {
        this.translations = translations;
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
        translations.add(translation);
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
        translations.removeWhere((translation) => translation.id == id);
        emit(DeleteTranslationSuccessState());
      },
    );
  }
}
