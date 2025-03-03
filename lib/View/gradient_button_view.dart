import 'package:flutter/material.dart';
import 'package:mvvm/common/theme.dart';

class GradientButtonView extends StatelessWidget {
  final String buttontext;
  final VoidCallback onPressed;
  const GradientButtonView(
      {super.key, required this.buttontext, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        gradient: LinearGradient(colors: ThemeDataList.gradientColor),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ThemeDataList.transparentColor,
          shadowColor: ThemeDataList.transparentColor,
          shape: RoundedRectangleBorder(),
          fixedSize: Size(395, 55),
        ),
        child: Text(
          buttontext,
          style: ThemeDataList.apptext,
        ),
      ),
    );
  }
}
