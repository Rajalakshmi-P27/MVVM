import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class ValidatorViewmodel with ChangeNotifier {
  final alphaExp = RegExp(r'^[a-zA-Z]$');
  final phoneexp = RegExp(r'^\d{10}$');
  final ageexp = RegExp(r'^\d{2}$');

  String? validatorField(String? value) {
    if (value!.isEmpty) {
      return 'This field is required';
    }
    return null; // Validation success
  }

  String? contentname(String? value) {
    if (value!.isEmpty) {
      return "This field is required";
    } else if (!alphaExp.hasMatch(value)) {
      return 'Only Alphabets are allowed in a username';
    }
    return null;
  }

  String? contentemail(String? value) {
    if (value!.isEmpty) {
      return "This field is required";
    } else if (!EmailValidator.validate(value)) {
      return "Please enter valid email";
    }
    return null;
  }

  String? contentphone(String? value) {
    if (value!.isEmpty) {
      return "This field is required";
    } else if (!phoneexp.hasMatch(value)) {
      return "Please enter valid phone number";
    }
    return null;
  }

  String? contentage(String? value) {
    if (value!.isEmpty) {
      return "This field is required";
    } else if (!ageexp.hasMatch(value)) {
      return "Please enter valid age";
    }
    return null;
  }

  String? contentgender(String? value) {
    if (value!.isEmpty) {
      return "Please select Gender";
    }
    return null;
  }
}
