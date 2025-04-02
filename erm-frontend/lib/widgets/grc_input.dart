import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class GrcInput extends StatelessWidget {
  final inputKey;
  final String name;
  final String label;
  const GrcInput({super.key, required this.inputKey, required this.name, required this.label});

  @override
  Widget build(BuildContext context) {
    return  FormBuilderTextField(
        key: inputKey,
        name: name,
        decoration: InputDecoration(labelText: label),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
        ]),
      );
  }
}