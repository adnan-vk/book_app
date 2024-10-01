// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class bookModelAdapter extends TypeAdapter<bookModel> {
  @override
  final int typeId = 1;

  @override
  bookModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return bookModel(
      bookName: fields[1] as String,
      categery: fields[2] as String,
      details: fields[3] as String,
      review: fields[4] as String,
      index: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, bookModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.index)
      ..writeByte(1)
      ..write(obj.bookName)
      ..writeByte(2)
      ..write(obj.categery)
      ..writeByte(3)
      ..write(obj.details)
      ..writeByte(4)
      ..write(obj.review);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is bookModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
