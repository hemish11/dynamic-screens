// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FormModel _$FormModelFromJson(Map<String, dynamic> json) => FormModel(
      name: json['name'] as String,
      sections: (json['sections'] as List<dynamic>)
          .map((e) => Section.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FormModelToJson(FormModel instance) => <String, dynamic>{
      'name': instance.name,
      'sections': instance.sections,
    };
