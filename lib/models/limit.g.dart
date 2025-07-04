// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'limit.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LimitAdapter extends TypeAdapter<Limit> {
  @override
  final int typeId = 1;

  @override
  Limit read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Limit(
      categoryId: fields[0] as String,
      amount: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Limit obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.categoryId)
      ..writeByte(1)
      ..write(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LimitAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
