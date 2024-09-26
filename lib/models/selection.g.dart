// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Selection _$SelectionFromJson(Map<String, dynamic> json) => Selection(
      name: json['name'] as String,
      iconUrl: json['iconUrl'] as String?,
      selectionModule: json['selectionModule'],
      fields: json['fields'],
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      ctaText: json['ctaText'] as String?,
      suggestionTextStartIconUrl: json['suggestionTextStartIconUrl'] as String?,
      suggestionText: json['suggestionText'] as String?,
      deeplink: json['deeplink'] as String?,
      additionalData: json['additionalData'],
    );

Map<String, dynamic> _$SelectionToJson(Selection instance) => <String, dynamic>{
      'name': instance.name,
      'iconUrl': instance.iconUrl,
      'selectionModule': instance.selectionModule,
      'fields': instance.fields,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'ctaText': instance.ctaText,
      'suggestionTextStartIconUrl': instance.suggestionTextStartIconUrl,
      'suggestionText': instance.suggestionText,
      'deeplink': instance.deeplink,
      'additionalData': instance.additionalData,
    };
