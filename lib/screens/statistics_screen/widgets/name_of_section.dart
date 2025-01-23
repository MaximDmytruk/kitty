import 'package:flutter/material.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';

class NameOfSection extends StatelessWidget {
  final String name;
  const NameOfSection({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: interTextStyle(
        fontSize: 10.0,
        fontWeight: FontWeight.w500,
        color: ColorsApp.grey66,
      ),
    );
  }
}
