import 'package:hive_flutter/hive_flutter.dart';

import '../../features/translations/data/models/translation_model.dart';

class HiveService {
  static void setupHive() async {
    await Hive.initFlutter();
    await Hive.openBox<TranslationModel>("translationBox");
  }

  static Box<TranslationModel> _getTranslationBox() {
    return Hive.box<TranslationModel>("translationBox");
  }

  static List<TranslationModel> fetchTranslations() {
    final box = _getTranslationBox();
    return box.values.toList();
  }

  static Future<void> addTranslation(TranslationModel translation) async {
    final box = _getTranslationBox();
    await box.put(translation.id, translation);
  }

  static Future<void> deleteTranslation(String id) async {
    final box = _getTranslationBox();
    await box.delete(id);
  }
}
