import 'package:flutter/material.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';

class KittyTextButton extends StatefulWidget {
  final Function onPressed;
  final String name;

  const KittyTextButton({
    super.key,
    required this.onPressed,
    required this.name,
  });

  @override
  State<KittyTextButton> createState() => _KittyTextButtonState();
}

class _KittyTextButtonState extends State<KittyTextButton> {
  void onPressedAction() {
    widget.onPressed();
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
    return TextButton(
      onPressed: onPressedAction,
      child: Text(
        widget.name,
        style: interTextStyle(
          fontWeight: FontWeight.w500,
          color: KittyColors.blue106,
        ),
      ),
    );
  }
}
