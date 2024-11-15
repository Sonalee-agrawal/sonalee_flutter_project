import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quotes.g.dart';


@JsonSerializable()
@HiveType(typeId: 0)
class Quotes {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? quote;
  @HiveField(2)
  String? author;

  Quotes({
    this.id,
    this.quote,
    this.author,
  });

  
   factory Quotes.fromJson(Map<String, dynamic> json) =>
      _$QuotesFromJson(json);


}
