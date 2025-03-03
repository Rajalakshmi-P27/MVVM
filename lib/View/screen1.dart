import 'package:flutter/material.dart';
import 'package:mvvm/common/theme.dart';

import 'package:mvvm/View/Screen2.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to \"KR Associate\"",
              textAlign: ThemeDataList.textalign,
              style: ThemeDataList.style,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  gradient:
                      LinearGradient(colors: ThemeDataList.gradientColor)),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsCollection()));
                },
                style: ThemeDataList.buttonstyle,
                child: Text("Get Started -> ",
                    style: ThemeDataList.buttontextstyle),
              ),
            )
          ],
        ),
      )),
    );
  }
}
