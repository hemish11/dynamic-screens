// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Field _$FieldFromJson(Map<String, dynamic> json) => Field(
      name: json['name'] as String,
      fieldId: json['fieldId'] as String,
      status: $enumDecode(_$StatusEnumMap, json['status']),
      value: json['value'] as String? ?? '',
      properties:
          FieldProperties.fromJson(json['properties'] as Map<String, dynamic>),
      version: json['version'] as String,
    );

Map<String, dynamic> _$FieldToJson(Field instance) => <String, dynamic>{
      'name': instance.name,
      'fieldId': instance.fieldId,
      'status': _$StatusEnumMap[instance.status]!,
      'value': instance.value,
      'properties': instance.properties,
      'version': instance.version,
    };

const _$StatusEnumMap = {
  Status.pending: 'Pending',
  Status.completed: 'Completed',
};
