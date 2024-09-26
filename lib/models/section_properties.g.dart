// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section_properties.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectionProperties _$SectionPropertiesFromJson(Map<String, dynamic> json) =>
    SectionProperties(
      headerIconUrl: json['headerIconUrl'] as String,
      headerSubtitle: json['headerSubtitle'] as String,
      headerTitle: json['headerTitle'] as String,
      type: $enumDecode(_$FieldTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$SectionPropertiesToJson(SectionProperties instance) =>
    <String, dynamic>{
      'headerIconUrl': instance.headerIconUrl,
      'headerSubtitle': instance.headerSubtitle,
      'headerTitle': instance.headerTitle,
      'type': _$FieldTypeEnumMap[instance.type]!,
    };

const _$FieldTypeEnumMap = {
  FieldType.form: 'form',
};
