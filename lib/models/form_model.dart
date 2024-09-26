import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'form_model.g.dart';

@JsonSerializable()
class FormModel {
  final String name;
  final List<Section> sections;

  FormModel({required this.name, required this.sections});

  factory FormModel.fromJson(Map<String, dynamic> json) =>
      _$FormModelFromJson(json);
  Map<String, dynamic> toJson() => _$FormModelToJson(this);
}
