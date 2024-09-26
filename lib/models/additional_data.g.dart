// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'additional_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdditionalData _$AdditionalDataFromJson(Map<String, dynamic> json) =>
    AdditionalData(
      redirectUrl: json['redirectUrl'] as String,
      data: json['data'],
      isIframe: json['isIframe'] as bool,
      isExternalProvider: json['isExternalProvider'] as bool,
    );

Map<String, dynamic> _$AdditionalDataToJson(AdditionalData instance) =>
    <String, dynamic>{
      'redirectUrl': instance.redirectUrl,
      'data': instance.data,
      'isIframe': instance.isIframe,
      'isExternalProvider': instance.isExternalProvider,
    };
