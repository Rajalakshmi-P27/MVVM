import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm/Model/age_model.dart';
//import 'package:mvvm/Model/phone_age_model.dart';
import 'package:mvvm/View%20Model/validator_viewmodel.dart';

class AgeViewmodel with ChangeNotifier {
  AgeModel agemodel;
  final String heading;
  final String required;
  final String hinttext;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  AgeViewmodel({
    required this.heading,
    this.required = "*",
    required this.hinttext,
    required this.controller,
    this.validator,
  }) : agemodel = AgeModel(
          heading: heading,
          required: required,
          hinttext: hinttext,
          controller: controller,
          validator: validator ??
              (value) {
                ValidatorViewmodel validatorViewmodel = ValidatorViewmodel();
                return validatorViewmodel.contentage(value);
              },
        );

  List<TextInputFormatter> inputFormatter = [];

  void limit(String heading) {
    if (heading.toLowerCase().contains('phone')) {
      inputFormatter = [FilteringTextInputFormatter.digitsOnly];
    } else if (heading.toLowerCase().contains('age')) {
      inputFormatter = [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(2)
      ];
    }
    notifyListeners();
  }
}
