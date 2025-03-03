import 'package:flutter/material.dart';
import 'package:mvvm/View%20Model/age_viewmodel.dart';
import 'package:mvvm/View%20Model/datepicker_viewmodel.dart';
import 'package:mvvm/View%20Model/dropdown_viewmodel.dart';
import 'package:mvvm/View%20Model/phone_age_viemodel.dart';
import 'package:mvvm/View%20Model/validator_viewmodel.dart';
import 'package:mvvm/View/screen1.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DatepickerViewmodel(
            heading: 'Date of Birth',
            required: '*',
            hinttext: 'DOB',
            controller: TextEditingController(),
          ),
        ),
        ChangeNotifierProvider(
          create: ((context) => DropdownViewmodel(
              items: ["Male", "Female", "Others"],
              heading: 'Gender',
              validator: (value) =>
                  value == null ? 'Please select Gender' : null,
              onChanged: (value) {
                // Update selected value inside the ViewModel
                context.read<DropdownViewmodel>().selectedValue.value = value;
              })),
        ),
        ChangeNotifierProvider(
          create: (context) => PhoneAgeViewmodel(
            heading: 'Phone',
            hinttext: 'Enter your phone number',
            controller: TextEditingController(),
            validator: (value) {
              final validatorViewmodel =
                  Provider.of<ValidatorViewmodel>(context, listen: false);
              return validatorViewmodel.contentphone(value);
            },
          ),
        ),
        ChangeNotifierProvider(
          create: ((context) => AgeViewmodel(
                heading: 'Age',
                hinttext: 'Age',
                controller: TextEditingController(),
                validator: (value) =>
                    context.read<ValidatorViewmodel>().contentage(value),
              )),
        ),
        ChangeNotifierProvider(
          create: (context) => ValidatorViewmodel(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        home: const Screen1(),
      ),
    );
  }
}
