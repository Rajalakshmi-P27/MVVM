import 'package:flutter/material.dart';
import 'package:mvvm/View/Datepicker_view.dart';
import 'package:mvvm/View/age_view.dart';
import 'package:mvvm/View/dropdown_view.dart';
import 'package:mvvm/View/gradient_button_view.dart';
import 'package:mvvm/View/phone_age_view.dart';
import 'package:mvvm/View/text_field_view.dart';
import 'package:mvvm/common/controller.dart';
import 'package:mvvm/View/screen3.dart';

import 'package:mvvm/View%20Model/validator_viewmodel.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final _formkey = GlobalKey<FormState>();

  final controller = Controller();
  final validator = ValidatorViewmodel();
  String? selectedGender;
  String? selectedExperience;

  // To Validate the form through submit,
  void _submitValidator() {
    if (_formkey.currentState!.validate() &&
        selectedGender != null &&
        selectedExperience != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SuccessPage(),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      // 1. First Name
                      TextFieldView(
                        hinttext: "First Name",
                        controller: controller.firstnameController,
                        heading: 'First Name',
                        validator: (value) {
                          return validator.contentname(value);
                        },
                      ),

                      // 2. Last Name
                      TextFieldView(
                        hinttext: "Last Name",
                        controller: controller.lastnameController,
                        heading: 'Last Name',
                        validator: (value) {
                          return validator.contentname(value);
                        },
                      ),

                      //3. Email
                      TextFieldView(
                        hinttext: "Email",
                        controller: controller.emailController,
                        heading: 'Email',
                        validator: (value) {
                          return validator.contentemail(value);
                        },
                      ),

                      // 4. DOB
                      Datepickerview(),

                      //5.Age
                      AgeView(),

                      //6. Gender
                      DropdownView(),

                      // 7. Phone Number
                      PhoneAgeView(),

                      // 8. Address
                      TextFieldView(
                        hinttext: "Address",
                        controller: controller.addressController,
                        heading: 'Address',
                        validator: (value) => validator.validatorField(value!),
                      ),
                    ],
                  ),
                ),
              ),
              // 9. Submit Button
              GradientButtonView(
                  buttontext: "Submit", onPressed: () => _submitValidator())
            ],
          ),
        ),
      ),
    );
  }
}
