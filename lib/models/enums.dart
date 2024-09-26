import 'package:json_annotation/json_annotation.dart';

enum Status {
  @JsonValue('Pending')
  pending,

  @JsonValue('Completed')
  completed,
}

enum InputType {
  @JsonValue('text-name')
  textName,

  @JsonValue('date')
  date,

  @JsonValue('single-selection')
  singleSelection,

  @JsonValue('pincode')
  pincode,

  @JsonValue('address')
  address,

  @JsonValue('locality')
  locality,

  @JsonValue('city')
  city,
}

enum FieldType {
  @JsonValue('form')
  form,
}
