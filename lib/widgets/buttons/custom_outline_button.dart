import 'package:flutter/material.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';

class CustomOutlineButton extends StatelessWidget {
  final Function()? onPressed;
  final String? buttonName;

  const CustomOutlineButton({
    super.key,
    this.onPressed,
    this.buttonName,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: ColorsApp.transparent,
          shadowColor: ColorsApp.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              4.0,
            ),
            side: BorderSide(
              color: ColorsApp.grey189,
            ),
          )),
      child: Text(
        buttonName ?? 'NoName',
        style: interTextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: ColorsApp.blue106,
        ),
      ),
    );
  }
}
