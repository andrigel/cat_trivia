import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fact.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class Fact extends HiveObject {
  @HiveField(0)
  @JsonKey(name: 'text')
  final String text;
  @HiveField(1)
  @JsonKey(name: 'updatedAt')
  final DateTime updatedAt;
  Fact({
    required this.text,
    required this.updatedAt
  });

  factory Fact.fromJson(Map<String, dynamic> json) =>
  _$FactFromJson(json);
  Map<String, dynamic> toJson() => _$FactToJson(this);
}