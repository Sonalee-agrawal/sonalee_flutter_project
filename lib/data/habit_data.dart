import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';


part 'habit_data.g.dart';


@JsonSerializable()
@HiveType(typeId: 2)
class HabitData {

  @HiveField(0)
  String? id;
  @HiveField(1)
  String? habitName;
  @HiveField(2)
  String? habitType;
  @HiveField(3)
  String? targetFrequency;
  @HiveField(4)
  String? completionRate;
 @HiveField(5)
  String? habitCategory;


HabitData({
  this.id,
  this.habitName,
  this.habitType,
  this.targetFrequency,
  this.completionRate,
  this.habitCategory
});


   factory HabitData.fromJson(Map<String, dynamic> json) =>
      _$HabitDataFromJson(json);

}