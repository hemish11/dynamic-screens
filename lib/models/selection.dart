import 'package:json_annotation/json_annotation.dart';

part 'selection.g.dart';

@JsonSerializable()
class Selection {
  final String name;
  final String? iconUrl;
  final dynamic selectionModule;
  final dynamic fields;
  final String? title;
  final String? subtitle;
  final String? ctaText;
  final String? suggestionTextStartIconUrl;
  final String? suggestionText;
  final String? deeplink;
  final dynamic additionalData;

  Selection({
    required this.name,
    this.iconUrl,
    this.selectionModule,
    this.fields,
    this.title,
    this.subtitle,
    this.ctaText,
    this.suggestionTextStartIconUrl,
    this.suggestionText,
    this.deeplink,
    this.additionalData,
  });

  factory Selection.fromJson(Map<String, dynamic> json) =>
      _$SelectionFromJson(json);
  Map<String, dynamic> toJson() => _$SelectionToJson(this);
}
