// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalProductAdapter extends TypeAdapter<LocalProduct> {
  @override
  final int typeId = 0;

  @override
  LocalProduct read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalProduct(
      name: fields[0] as String?,
      salary: fields[1] as String?,
      salaryAfterDiscount: fields[2] as String?,
      image: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, LocalProduct obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.salary)
      ..writeByte(2)
      ..write(obj.salaryAfterDiscount)
      ..writeByte(3)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
