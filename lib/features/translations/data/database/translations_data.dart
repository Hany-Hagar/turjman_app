import '../../../../core/services/hive_service.dart';
import '../models/translation_model.dart';

class TranslationsData {
  List<TranslationModel> fetchTranslations() {
    return HiveService.fetchTranslations();
  }

  Future<void> addTranslation(TranslationModel translation) async {
    await HiveService.addTranslation(translation);
  }

  Future<void> deleteTranslation(String id) async {
    await HiveService.deleteTranslation(id);
  }
}
