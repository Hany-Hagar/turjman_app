// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translation_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TranslationModelAdapter extends TypeAdapter<TranslationModel> {
  @override
  final int typeId = 0;

  @override
  TranslationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TranslationModel(
      id: fields[0] as String,
      sourceLanguage: fields[1] as String,
      targetLanguage: fields[2] as String,
      sourceText: fields[3] as String,
      translatedText: fields[4] as String,
      translationType: fields[5] as TranslationType,
      createdAt: fields[6] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, TranslationModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.sourceLanguage)
      ..writeByte(2)
      ..write(obj.targetLanguage)
      ..writeByte(3)
      ..write(obj.sourceText)
      ..writeByte(4)
      ..write(obj.translatedText)
      ..writeByte(5)
      ..write(obj.translationType)
      ..writeByte(6)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TranslationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
