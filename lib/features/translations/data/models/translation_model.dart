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
}