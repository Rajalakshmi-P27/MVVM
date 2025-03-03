import 'package:flutter/material.dart';

import 'package:mvvm/common/theme.dart';

class TextFieldView extends StatefulWidget {
  final String heading;
  final String required;
  final String hinttext;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const TextFieldView({
    super.key,
    required this.heading,
    this.required = "*",
    required this.hinttext,
    required this.controller,
    this.validator,
  });

  @override
  State<TextFieldView> createState() => _TextfieldState();
}

class _TextfieldState extends State<TextFieldView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //1. Heading, *
        Row(
          children: [
            Text(
              widget.heading,
              style: ThemeDataList.authfield,
            ),
            Text(widget.required, style: ThemeDataList.requiredfield),
          ],
        ),

        //2.hint_field
        SizedBox(
          width: double.infinity,
          height: 60,
          child: TextFormField(
            controller: widget.controller,
            validator: widget.validator,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ThemeDataList.borderColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: ThemeDataList.borderColor, width: 2),
              ),
              hintText: widget.hinttext,
              contentPadding: const EdgeInsets.all(10),
              hintStyle: ThemeDataList.hinttext,
            ),
          ),
        ),
      ],
    );
  }
}
