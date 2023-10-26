// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_image_dao.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConstactImageDAOAdapter extends TypeAdapter<ConstactImageDAO> {
  @override
  final int typeId = 1;

  @override
  ConstactImageDAO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ConstactImageDAO(
      fields[0] as String,
      fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ConstactImageDAO obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj._idContact)
      ..writeByte(1)
      ..write(obj._imgUri);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConstactImageDAOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
