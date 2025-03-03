import 'package:flutter/material.dart';
import 'package:mvvm/View%20Model/datepicker_viewmodel.dart';
import 'package:mvvm/common/theme.dart';
import 'package:provider/provider.dart';

class Datepickerview extends StatelessWidget {
  const Datepickerview({super.key});

  @override
  Widget build(BuildContext context) {
    final datepick = Provider.of<DatepickerViewmodel>(context);
    final controller = datepick.datepickermodel.controller;
    final heading = datepick.datepickermodel.heading;
    final required = datepick.datepickermodel.required;
    final validator = datepick.datepickermodel.validator;
    final hinttext = datepick.datepickermodel.hinttext;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              heading!,
              style: ThemeDataList.authfield,
            ),
            const SizedBox(width: 5),
            Text(required, style: ThemeDataList.requiredfield),
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          height: 60,
          child: TextFormField(
            controller: controller,
            validator: validator,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ThemeDataList.borderColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: ThemeDataList.borderColor, width: 2),
              ),
              hintText: hinttext,
              prefixIcon: const Icon(Icons.calendar_today),
              contentPadding: const EdgeInsets.all(10),
              hintStyle: ThemeDataList.hinttext,
            ),
            readOnly: true,
            onTap: () => datepick.selectdate(context, controller!),
          ),
        ),
      ],
    );
  }
}
