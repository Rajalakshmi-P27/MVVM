import 'package:flutter/material.dart';
import 'package:mvvm/common/theme.dart';
import 'package:mvvm/View Model/dropdown_viewmodel.dart';
import 'package:provider/provider.dart';

class DropdownView extends StatefulWidget {
  const DropdownView({super.key});

  @override
  _DropdownViewState createState() => _DropdownViewState();
}

class _DropdownViewState extends State<DropdownView> {
  DropdownMenuItem<String> _buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(item),
        ),
      );

  @override
  Widget build(BuildContext context) {
    //final DropdownController _controller = DropdownController();
    final datepick = Provider.of<DropdownViewmodel>(context);
    final items = datepick.dropdownmodel.items;
    final heading = datepick.dropdownmodel.heading;
    final required = datepick.dropdownmodel.required;
    final validator = datepick.dropdownmodel.validator;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Heading & *
        Row(
          children: [
            Text(heading, style: ThemeDataList.authfield),
            Text(required, style: ThemeDataList.requiredfield),
          ],
        ),
        const SizedBox(height: 8),
        // DropDown with validation
        FormField<String>(
          validator: validator,
          builder: (FormFieldState<String> state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: state.hasError
                          ? ThemeDataList.errorColor
                          : ThemeDataList.borderColor,
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: datepick.selectedValue.value,
                      isExpanded: true,
                      iconSize: 36,
                      icon: const Icon(Icons.arrow_drop_down,
                          color: Colors.black),
                      items: items.map(_buildMenuItem).toList(),
                      hint: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text("Select", style: ThemeDataList.hinttext),
                      ),
                      onChanged: (value) => datepick.handleChanged(
                          value, state, () => setState(() {})),
                    ),
                  ),
                ),
                datepick.buildError(
                    state, TextStyle(color: ThemeDataList.errorColor)),
              ],
            );
          },
        ),
      ],
    );
  }
}
