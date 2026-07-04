import 'package:hive/hive.dart';

part 'translation_type.g.dart';

@HiveType(typeId: 1)
enum TranslationType {
  @HiveField(0)
  text,

  @HiveField(1)
  image,

  @HiveField(2)
  camera,

  @HiveField(3)
  audio,
}