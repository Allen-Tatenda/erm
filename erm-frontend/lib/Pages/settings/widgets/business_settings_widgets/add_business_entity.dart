import 'package:erm/widgets/grc_default_button.dart';
import 'package:erm/widgets/grc_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AddBusinessEntity extends StatefulWidget {
  const AddBusinessEntity({
    super.key,
  });

  @override
  State<AddBusinessEntity> createState() => _AddBusinessEntityState();
}

class _AddBusinessEntityState extends State<AddBusinessEntity> {
  final _formKey = GlobalKey<FormBuilderState>();
  final entityNameKey = GlobalKey<FormBuilderFieldState>();
  final entityTypeKey = GlobalKey<FormBuilderFieldState>();
  final entityStatusKey = GlobalKey<FormBuilderFieldState>();

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 3,
                child: Column(
                  children: [
                    GrcInput(
                        inputKey: entityNameKey,
                        name: "Entity Name",
                        label: "Entity Name"),
                    const SizedBox(height: 10),
                    GrcInput(
                        inputKey: entityTypeKey,
                        name: "Entity Type",
                        label: "Entity Type"),
                    const SizedBox(height: 10),
                     GrcInput(
                        inputKey: entityStatusKey,
                        name: "Entity Status",
                        label: "Entity Status"),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        GrcDefaultButton(
            title: "Submit",
            function: () {
              _formKey.currentState?.saveAndValidate();
              debugPrint(_formKey.currentState?.value.toString());
              // On another side, can access all field values without saving form with instantValues
              _formKey.currentState?.validate();

              debugPrint(_formKey.currentState?.instantValue.toString());
            }),
      ],
    ));
  }
}
