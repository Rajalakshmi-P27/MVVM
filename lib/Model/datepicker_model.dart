import 'package:flutter/material.dart';

class Datepickermodel {
  final String? heading;
  final String required;
  final String? hinttext;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  Datepickermodel({
    this.heading,
    this.required = "*",
    this.hinttext,
    this.controller,
    this.validator,
  });
}
