import 'package:hive/hive.dart';
import '../../../../core/enum/translation_type.dart';
part 'translation_model.g.dart';


@HiveType(typeId: 0)
class TranslationModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String sourceLanguage;

  @HiveField(2)
  final String targetLanguage;

  @HiveField(3)
  final String sourceText;

  @HiveField(4)
  final String translatedText;

  @HiveField(5)
  final TranslationType translationType;

  @HiveField(6)
  final DateTime createdAt;

  TranslationModel({
    required this.id,
    required this.sourceLanguage,
    required this.targetLanguage,
    required this.sourceText,
    required this.translatedText,
    required this.translationType,
    required this.createdAt,
  });

  // From JSON
  factory TranslationModel.newTranslation({
    required String source,
    required String target,
    required String sourceText,
    required String translatedText,
    required TranslationType translationType,
  }) {
    return TranslationModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      sourceLanguage: source,
      targetLanguage: target,
      sourceText: sourceText,
      translatedText: translatedText,
      translationType: translationType,
      createdAt: DateTime.now(),
    );
  }

  // empty constructor for Hive
  TranslationModel.empty()
    : id = '00000000-0000-0000-0000-000000000000',
      sourceLanguage = 'english',
      targetLanguage = 'spanish',
      sourceText = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      translatedText = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      translationType = TranslationType.audio,
      createdAt = DateTime.now();
}
