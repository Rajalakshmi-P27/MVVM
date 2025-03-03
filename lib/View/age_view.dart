import 'package:flutter/material.dart';

///import 'package:mvvm/Model/age_model.dart';
import 'package:mvvm/View%20Model/age_viewmodel.dart';
//import 'package:mvvm/View%20Model/phone_age_viemodel.dart';
import 'package:mvvm/common/theme.dart';
import 'package:provider/provider.dart';

class AgeView extends StatefulWidget {
  const AgeView({
    super.key,
  });

  @override
  State<AgeView> createState() => _AgeState();
}

class _AgeState extends State<AgeView> {
  @override
  void initState() {
    super.initState();
    final viewModel = context.read<AgeViewmodel>();
    viewModel.limit(viewModel.heading); // Use the heading from the ViewModel
  }

  @override
  Widget build(BuildContext context) {
    final agepick = Provider.of<AgeViewmodel>(context);
    final hinttext = agepick.agemodel.hinttext;
    final heading = agepick.agemodel.heading;
    final required = agepick.agemodel.required;
    final validator = agepick.agemodel.validator;
    final controller = agepick.agemodel.controller;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Heading and required mark
        Row(
          children: [
            Text(heading, style: ThemeDataList.authfield),
            Text(required, style: ThemeDataList.requiredfield),
          ],
        ),
        const SizedBox(height: 8),

        // Text field with input formatters
        SizedBox(
          width: double.infinity,
          height: 60,
          child: TextFormField(
            controller: controller,
            validator: validator,
            inputFormatters: agepick.inputFormatter,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ThemeDataList.borderColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: ThemeDataList.borderColor, width: 2),
              ),
              hintText: hinttext,
              contentPadding: const EdgeInsets.all(10),
              hintStyle: ThemeDataList.hinttext,
            ),
          ),
        ),
      ],
    );
  }
}
