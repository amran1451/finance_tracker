// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FinTransactionAdapter extends TypeAdapter<FinTransaction> {
  @override
  final int typeId = 0;

  @override
  FinTransaction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FinTransaction(
      id: fields[0] as String,
      date: fields[1] as DateTime,
      amount: fields[2] as double,
      categoryId: fields[3] as String,
      accountId: fields[4] as String,
      comment: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, FinTransaction obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.categoryId)
      ..writeByte(4)
      ..write(obj.accountId)
      ..writeByte(5)
      ..write(obj.comment);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FinTransactionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
