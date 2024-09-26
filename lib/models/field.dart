import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'field.g.dart';

@JsonSerializable()
class Field {
  final String name;
  final String fieldId;
  final Status status;
  String value;
  final FieldProperties properties;
  final String version;

  Field({
    required this.name,
    required this.fieldId,
    required this.status,
    this.value = '',
    required this.properties,
    required this.version,
  });

  factory Field.fromJson(Map<String, dynamic> json) => _$FieldFromJson(json);
  Map<String, dynamic> toJson() => _$FieldToJson(this);
}
