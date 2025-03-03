import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm/Model/phone_age_model.dart';
import 'package:provider/provider.dart';

class PhoneAgeViewmodel with ChangeNotifier {
  PhoneAgeModel phoneagemodel;
  final String heading;
  final String required;
  final String hinttext;
  final TextEditingController controller;

  PhoneAgeViewmodel({
    required this.heading,
    this.required = "*",
    required this.hinttext,
    required this.controller,
    required String? Function(String?) validator,
  }) : phoneagemodel = PhoneAgeModel(
          heading: heading,
          required: required,
          hinttext: hinttext,
          controller: controller,
          validator: validator,
        );

  List<TextInputFormatter> inputFormatter = [];

  void limit(String heading) {
    if (heading.toLowerCase().contains('phone')) {
      inputFormatter = [FilteringTextInputFormatter.digitsOnly];
    } else if (heading.toLowerCase().contains('age')) {
      inputFormatter = [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(2),
      ];
    }
    notifyListeners();
  }
}
