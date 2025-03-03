import 'package:flutter/material.dart';
import 'package:mvvm/View/screen1.dart';
import 'package:mvvm/common/theme.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Successfully collected the details...\nThank You !!!",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  gradient:
                      LinearGradient(colors: ThemeDataList.gradientColor)),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Screen1()));
                },
                style: ThemeDataList.buttonstyle,
                child: Text("Home", style: ThemeDataList.buttontextstyle),
              ),
            )
          ],
        ),
      ),
    );
  }
}
