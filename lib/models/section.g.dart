// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Section _$SectionFromJson(Map<String, dynamic> json) => Section(
      name: json['name'] as String,
      sectionId: json['sectionId'] as String,
      status: $enumDecode(_$StatusEnumMap, json['status']),
      version: json['version'] as String,
      properties: SectionProperties.fromJson(
          json['properties'] as Map<String, dynamic>),
      additionalData: AdditionalData.fromJson(
          json['additionalData'] as Map<String, dynamic>),
      fields: (json['fields'] as List<dynamic>)
          .map((e) => Field.fromJson(e as Map<String, dynamic>))
          .toList(),
      typeOfDataRequired: json['typeOfDataRequired'] as int?,
      requestExpectedStatus: json['requestExpectedStatus'] as int?,
    );

Map<String, dynamic> _$SectionToJson(Section instance) => <String, dynamic>{
      'name': instance.name,
      'sectionId': instance.sectionId,
      'status': _$StatusEnumMap[instance.status]!,
      'version': instance.version,
      'properties': instance.properties,
      'additionalData': instance.additionalData,
      'fields': instance.fields,
      'typeOfDataRequired': instance.typeOfDataRequired,
      'requestExpectedStatus': instance.requestExpectedStatus,
    };

const _$StatusEnumMap = {
  Status.pending: 'Pending',
  Status.completed: 'Completed',
};
