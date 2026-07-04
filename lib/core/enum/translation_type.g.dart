// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translation_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TranslationTypeAdapter extends TypeAdapter<TranslationType> {
  @override
  final int typeId = 1;

  @override
  TranslationType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TranslationType.text;
      case 1:
        return TranslationType.image;
      case 2:
        return TranslationType.camera;
      case 3:
        return TranslationType.audio;
      default:
        return TranslationType.text;
    }
  }

  @override
  void write(BinaryWriter writer, TranslationType obj) {
    switch (obj) {
      case TranslationType.text:
        writer.writeByte(0);
        break;
      case TranslationType.image:
        writer.writeByte(1);
        break;
      case TranslationType.camera:
        writer.writeByte(2);
        break;
      case TranslationType.audio:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TranslationTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
