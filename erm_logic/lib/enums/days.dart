import 'package:json_annotation/json_annotation.dart';

enum Day {
  @JsonValue('SUNDAY')
  sunday,
  @JsonValue('MONDAY')
  monday,
  @JsonValue('TUESDAY')
  tuesday,
  @JsonValue('WEDNESDAY')
  wednesday,
  @JsonValue('THURSDAY')
  thursday,
  @JsonValue('FRIDAY')
  friday,
  @JsonValue('SATURDAY')
  saturday,
}
