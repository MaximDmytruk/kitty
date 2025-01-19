import 'package:flutter/material.dart';
import 'package:kitty/styles/colors/colors_app.dart';

import '../styles/font/fontstyle_app.dart';

class CustomFeeledButton extends StatefulWidget {
  final Function onPressed;
  final String name;
  final Widget? icon;
  final EdgeInsets? padding;

  const CustomFeeledButton({
    super.key,
    required this.onPressed,
    required this.name,
    this.icon, this.padding,
  });

  @override
  State<CustomFeeledButton> createState() => _CustomFeeledButtonState();
}

class _CustomFeeledButtonState extends State<CustomFeeledButton> {
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
    return ElevatedButton.icon(
      onPressed: onPressedAction,
      style: ElevatedButton.styleFrom(
        padding: widget.padding,
        backgroundColor: KittyColors.blue106,
        disabledBackgroundColor: KittyColors.lightGrey224,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            44.0,
          ),
        ),
      ),
      icon: widget.icon,
      label: Text(
        widget.name,
        style: interTextStyle(
          fontWeight: FontWeight.w500,
          color: KittyColors.white,
        ),
      ),
    );
  }
}
