import 'package:flutter/material.dart';

class AgeModel {
  final String heading;
  final String required;
  final String hinttext;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const AgeModel({
    required this.heading,
    required this.required,
    required this.hinttext,
    required this.controller,
    required this.validator,
  });
}
