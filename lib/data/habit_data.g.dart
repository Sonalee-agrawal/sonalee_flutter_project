// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HabitDataAdapter extends TypeAdapter<HabitData> {
  @override
  final int typeId = 2;

  @override
  HabitData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HabitData(
      id: fields[0] as String?,
      habitName: fields[1] as String?,
      habitType: fields[2] as String?,
      targetFrequency: fields[3] as String?,
      completionRate: fields[4] as String?,
      habitCategory: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HabitData obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.habitName)
      ..writeByte(2)
      ..write(obj.habitType)
      ..writeByte(3)
      ..write(obj.targetFrequency)
      ..writeByte(4)
      ..write(obj.completionRate)
      ..writeByte(5)
      ..write(obj.habitCategory);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HabitDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HabitData _$HabitDataFromJson(Map<String, dynamic> json) => HabitData(
      id: json['id'] as String?,
      habitName: json['habitName'] as String?,
      habitType: json['habitType'] as String?,
      targetFrequency: json['targetFrequency'] as String?,
      completionRate: json['completionRate'] as String?,
      habitCategory: json['habitCategory'] as String?,
    );

Map<String, dynamic> _$HabitDataToJson(HabitData instance) => <String, dynamic>{
      'id': instance.id,
      'habitName': instance.habitName,
      'habitType': instance.habitType,
      'targetFrequency': instance.targetFrequency,
      'completionRate': instance.completionRate,
      'habitCategory': instance.habitCategory,
    };
