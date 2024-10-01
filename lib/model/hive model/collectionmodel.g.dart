// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collectionmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class collectionModelAdapter extends TypeAdapter<collectionModel> {
  @override
  final int typeId = 1;

  @override
  collectionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return collectionModel(
      categery: fields[1] as String,
      index: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, collectionModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.index)
      ..writeByte(1)
      ..write(obj.categery);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is collectionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
