import 'package:flutter/material.dart';
import 'package:kitty/styles/colors/colors_app.dart';

import '../styles/font/fontstyle_app.dart';

class FeeledButton extends StatefulWidget {
  final Function onPressed;
  final String name;

  const FeeledButton({
    super.key,
    required this.onPressed,
    required this.name,
  });

  @override
  State<FeeledButton> createState() => _FeeledButtonState();
}

class _FeeledButtonState extends State<FeeledButton> {
  void onPressedAction() {
    widget.onPressed();

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressedAction,
      style: ElevatedButton.styleFrom(
        backgroundColor: KittyColors.blue106,
        disabledBackgroundColor: KittyColors.lightGrey224,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            4.0,
          ),
        ),
      ),
      child: Text(
        widget.name,
        style: interTextStyle(
          fontWeight: FontWeight.w500,
          color: KittyColors.white,
        ),
      ),
    );
  }
}
