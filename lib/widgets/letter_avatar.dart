import 'package:flutter/material.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';

class LetterAvatar extends StatelessWidget {
  final String firstChar;
  final Color backgroundColor;

  const LetterAvatar({
    super.key,
    required this.firstChar,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48.0,
      height: 48.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
      ),
      child: Center(
        child: Text(
          firstChar,
          style: interTextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            color: ColorsApp.grey66,
          ),
        ),
      ),
    );
  }
}
