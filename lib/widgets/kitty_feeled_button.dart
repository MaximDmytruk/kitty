import 'package:flutter/material.dart';
import 'package:kitty/styles/colors/colors_app.dart';

import '../styles/font/fontstyle_app.dart';

class KittyFeeledButton extends StatefulWidget {
  final Function onPressed;
  final String name;

  const KittyFeeledButton({
    super.key,
    required this.onPressed,
    required this.name,
  });

  @override
  State<KittyFeeledButton> createState() => _KittyFeeledButtonState();
}

class _KittyFeeledButtonState extends State<KittyFeeledButton> {
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
    return ElevatedButton(
      onPressed: onPressedAction,
      style: ElevatedButton.styleFrom(
        backgroundColor: KittyColors.blue106,
        disabledBackgroundColor: KittyColors.lightGrey224,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            44.0,
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
