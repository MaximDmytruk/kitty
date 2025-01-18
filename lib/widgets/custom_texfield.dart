import 'package:flutter/material.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';

class KittyTextfield extends StatefulWidget {
  final String labelText;
  final bool addObscureText;
  final TextEditingController controller;

  const KittyTextfield({
    super.key,
    required this.labelText,
    this.addObscureText = false,
    required this.controller,
  });

  @override
  State<KittyTextfield> createState() => _KittyTextfieldState();
}

class _KittyTextfieldState extends State<KittyTextfield> {
  bool obscureText = false;

  Icon visibility = Icon(Icons.visibility);
  Icon visibilityOff = Icon(Icons.visibility_off);
  Icon selectedVisibilityIcon = Icon(Icons.visibility_off);

  void changeVisibilityText() {
    if (obscureText == false) {
      selectedVisibilityIcon = visibilityOff;
      obscureText = true;
    } else {
      selectedVisibilityIcon = visibility;
      obscureText = false;
    }
    setState(() {});
  }

  @override
  void initState() {
    obscureText = widget.addObscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: obscureText,
      cursorColor: KittyColors.blue106,
      
      maxLines: 1,
      decoration: InputDecoration(
        suffixIcon: widget.addObscureText
            ? InkWell(
                onTap: changeVisibilityText,
                child: selectedVisibilityIcon,
              )
            : null,
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
          color: KittyColors.grey97,
        ),
        floatingLabelStyle: interTextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          color: KittyColors.blue106,
        ),
        
      ),
    );
  }
}
