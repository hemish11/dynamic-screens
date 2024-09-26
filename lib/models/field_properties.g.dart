// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field_properties.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FieldProperties _$FieldPropertiesFromJson(Map<String, dynamic> json) =>
    FieldProperties(
      errorText: json['errorText'] as String?,
      inputType: $enumDecodeNullable(_$InputTypeEnumMap, json['inputType']) ??
          InputType.textName,
      isEditable: json['isEditable'] as bool,
      maxLength: json['maxLength'] as int?,
      minLength: json['minLength'] as int?,
      subtitle: json['subtitle'] as String?,
      title: json['title'] as String?,
      hint: json['hint'] as String?,
      selections: (json['selections'] as List<dynamic>?)
          ?.map((e) => Selection.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FieldPropertiesToJson(FieldProperties instance) =>
    <String, dynamic>{
      'errorText': instance.errorText,
      'inputType': _$InputTypeEnumMap[instance.inputType]!,
      'isEditable': instance.isEditable,
      'maxLength': instance.maxLength,
      'minLength': instance.minLength,
      'subtitle': instance.subtitle,
      'title': instance.title,
      'hint': instance.hint,
      'selections': instance.selections,
    };

const _$InputTypeEnumMap = {
  InputType.textName: 'text-name',
  InputType.date: 'date',
  InputType.singleSelection: 'single-selection',
  InputType.pincode: 'pincode',
  InputType.address: 'address',
  InputType.locality: 'locality',
  InputType.city: 'city',
};
