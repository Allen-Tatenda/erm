import 'package:json_annotation/json_annotation.dart';

enum ProfileRole {
  @JsonValue('MANAGER')
  manager,
  @JsonValue('USER')
  user,
  @JsonValue('ORG_ADMIN')
  orgAdmin,
  @JsonValue('SYS_ADMIN')
  sysAdmin,
  @JsonValue('RECEPT')
  receptionist,
}
