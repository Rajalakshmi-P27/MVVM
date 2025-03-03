import 'package:flutter/material.dart';
import 'package:mvvm/common/theme.dart';
import 'package:mvvm/View/detail_page_screen2_view.dart';

class DetailsCollection extends StatefulWidget {
  const DetailsCollection({super.key});

  @override
  State<DetailsCollection> createState() => _DetailsCollectionState();
}

class _DetailsCollectionState extends State<DetailsCollection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Details collection",
          style: ThemeDataList.apptext,
        ),
        // Flexible space to add a background color to the appbar
        flexibleSpace: ThemeDataList.appbartheme,
        iconTheme: IconThemeData(color: ThemeDataList.apptext.color),
      ),
      body: DetailPage(),
    );
  }
}
