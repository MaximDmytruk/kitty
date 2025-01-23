import 'package:flutter/material.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';

class HeaderAppBar extends StatelessWidget {
  final String name;
  const HeaderAppBar({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsApp.lightGrey245,
      title: Text(
        name,
        style: interTextStyle(
          fontSize: 16.0,
          color: ColorsApp.grey66,
        ),
      ),
    );
  }
}
