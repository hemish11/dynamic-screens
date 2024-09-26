import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'section.g.dart';

@JsonSerializable()
class Section {
  final String name;
  final String sectionId;
  final Status status;
  final String version;
  final SectionProperties properties;
  final AdditionalData additionalData;
  final List<Field> fields;
  final int? typeOfDataRequired;
  final int? requestExpectedStatus;

  Section({
    required this.name,
    required this.sectionId,
    required this.status,
    required this.version,
    required this.properties,
    required this.additionalData,
    required this.fields,
    this.typeOfDataRequired,
    this.requestExpectedStatus,
  });

  factory Section.fromJson(Map<String, dynamic> json) =>
      _$SectionFromJson(json);
  Map<String, dynamic> toJson() => _$SectionToJson(this);
}
