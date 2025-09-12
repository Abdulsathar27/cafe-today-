// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cafe_order.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CafeOrderAdapter extends TypeAdapter<CafeOrder> {
  @override
  final int typeId = 6;

  @override
  CafeOrder read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CafeOrder(
      id: fields[0] as String,
      items: (fields[1] as List).cast<String>(),
      status: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CafeOrder obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.items)
      ..writeByte(2)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CafeOrderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
