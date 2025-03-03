import 'package:flutter/material.dart';
import 'package:mvvm/Model/dropdown_model.dart';

class DropdownViewmodel with ChangeNotifier {
  DropdownModel dropdownmodel;

  final List<String> items;
  final String heading;
  final String required;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;

  DropdownViewmodel({
    required this.heading,
    this.required = "*",
    required this.items,
    this.validator,
    this.onChanged,
  }) : dropdownmodel = DropdownModel(
          heading: heading,
          items: items,
          required: required,
          validator: validator ??
              (value) {
                return value == null ? 'Please select Gender' : null;
              },
          onChanged: onChanged,
        );

  final ValueNotifier<String?> selectedValue = ValueNotifier<String?>(null);

  void handleChanged(
      String? value, FormFieldState<String> state, VoidCallback setState) {
    selectedValue.value = value;
    state.didChange(value);
    setState();
  }

  Widget buildError(FormFieldState<String> state, TextStyle errorStyle) {
    if (!state.hasError) return SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        state.errorText ?? '',
        style: errorStyle,
      ),
    );
  }
}
