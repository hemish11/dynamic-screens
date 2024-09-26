import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'section_properties.g.dart';

@JsonSerializable()
class SectionProperties {
  final String headerIconUrl;
  final String headerSubtitle;
  final String headerTitle;
  final FieldType type;

  SectionProperties({
    required this.headerIconUrl,
    required this.headerSubtitle,
    required this.headerTitle,
    required this.type,
  });

  factory SectionProperties.fromJson(Map<String, dynamic> json) =>
      _$SectionPropertiesFromJson(json);
  Map<String, dynamic> toJson() => _$SectionPropertiesToJson(this);
}
