import 'package:flutter/material.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';

class KittyTextfield extends StatefulWidget {
  final String labelText;

  const KittyTextfield({
    super.key,
    required this.labelText,
  });

  @override
  State<KittyTextfield> createState() => _KittyTextfieldState();
}

class _KittyTextfieldState extends State<KittyTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: KittyColors.blue106,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: KittyColors.grey97,
          ),
        ),
        labelText: widget.labelText,
        labelStyle: interTextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            color: KittyColors.grey97),
        floatingLabelStyle: interTextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          color: KittyColors.blue106,
        ),
      ),
    );
  }
}
