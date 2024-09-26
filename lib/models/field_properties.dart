// lib/models/field_properties.dart

import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'field_properties.g.dart';

@JsonSerializable()
class FieldProperties {
  final String? errorText;

  @JsonKey(defaultValue: InputType.textName)
  final InputType inputType;
  final bool isEditable;
  final int? maxLength;
  final int? minLength;
  final String? subtitle;
  final String? title;
  final String? hint;
  final List<Selection>? selections;

  FieldProperties({
    this.errorText,
    this.inputType = InputType.textName,
    required this.isEditable,
    this.maxLength,
    this.minLength,
    this.subtitle,
    this.title,
    this.hint,
    this.selections,
  });

  factory FieldProperties.fromJson(Map<String, dynamic> json) =>
      _$FieldPropertiesFromJson(json);
  Map<String, dynamic> toJson() => _$FieldPropertiesToJson(this);
}
