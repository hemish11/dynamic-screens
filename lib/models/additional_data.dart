import 'package:json_annotation/json_annotation.dart';

part 'additional_data.g.dart';

@JsonSerializable()
class AdditionalData {
  final String redirectUrl;
  final dynamic data;
  final bool isIframe;
  final bool isExternalProvider;

  AdditionalData({
    required this.redirectUrl,
    this.data,
    required this.isIframe,
    required this.isExternalProvider,
  });

  factory AdditionalData.fromJson(Map<String, dynamic> json) =>
      _$AdditionalDataFromJson(json);
  Map<String, dynamic> toJson() => _$AdditionalDataToJson(this);
}
