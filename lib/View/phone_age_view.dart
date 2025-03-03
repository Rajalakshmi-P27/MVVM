import 'package:flutter/material.dart';
import 'package:mvvm/View%20Model/phone_age_viemodel.dart';
import 'package:mvvm/common/theme.dart';
import 'package:provider/provider.dart';

class PhoneAgeView extends StatefulWidget {
  const PhoneAgeView({
    super.key,
  });

  @override
  State<PhoneAgeView> createState() => _PhoneAgeState();
}

class _PhoneAgeState extends State<PhoneAgeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = context.read<PhoneAgeViewmodel>();
      viewModel.limit(viewModel.heading);
    });
  }

  @override
  Widget build(BuildContext context) {
    final phonepick = Provider.of<PhoneAgeViewmodel>(context);
    final hinttext = phonepick.phoneagemodel.hinttext;
    final heading = phonepick.phoneagemodel.heading;
    final required = phonepick.phoneagemodel.required;
    final validator = phonepick.phoneagemodel.validator;
    final controller = phonepick.phoneagemodel.controller;

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
            inputFormatters: phonepick.inputFormatter,
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
