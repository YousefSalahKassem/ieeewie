// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EventAdapter extends TypeAdapter<Event> {
  @override
  final int typeId = 1;

  @override
  Event read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Event(
      title: fields[0] as String,
      description: fields[1] as String,
      images: (fields[3] as List?)?.cast<dynamic>(),
      video: fields[4] as String?,
      startDate: fields[5] as String,
      location: fields[6] as String?,
      category: fields[7] as String?,
      hostName: fields[8] as String,
      linkExplore: fields[9] as String?,
      meetingLink: fields[10] as String?,
      id: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Event obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.images)
      ..writeByte(4)
      ..write(obj.video)
      ..writeByte(5)
      ..write(obj.startDate)
      ..writeByte(6)
      ..write(obj.location)
      ..writeByte(7)
      ..write(obj.category)
      ..writeByte(8)
      ..write(obj.hostName)
      ..writeByte(9)
      ..write(obj.linkExplore)
      ..writeByte(10)
      ..write(obj.meetingLink);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
