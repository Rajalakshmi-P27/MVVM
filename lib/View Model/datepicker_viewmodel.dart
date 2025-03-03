import 'package:flutter/material.dart';
import 'package:mvvm/Model/datepicker_model.dart';
import 'package:mvvm/View%20Model/validator_viewmodel.dart';

class DatepickerViewmodel with ChangeNotifier {
  Datepickermodel datepickermodel;

  DatepickerViewmodel({
    required String? heading,
    required String? required,
    required final String hinttext,
    required final TextEditingController controller,
    final String? Function(String?)? validator,
  }) : datepickermodel = Datepickermodel(
          controller: controller,
          hinttext: hinttext,
          heading: heading,
          validator: validator ??
              (value) {
                ValidatorViewmodel validatorViewmodel = ValidatorViewmodel();
                return validatorViewmodel.validatorField(value);
              },
        );

  Future<void> selectdate(
      BuildContext context, TextEditingController controller) async {
    DateTime? selecteddate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (selecteddate != null) {
      controller.text = selecteddate.toString().split(" ")[0];
      notifyListeners();
    }
  }
}
