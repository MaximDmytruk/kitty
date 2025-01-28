import 'package:flutter/material.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';

class CustomTextfield extends StatefulWidget {
  final String labelText;
  final bool addObscureText;
  final TextEditingController controller;
  final bool readOnly;
  final GestureTapCallback? onTap;
   final String? errorText;

  const CustomTextfield({
    super.key,
    required this.labelText,
    this.addObscureText = false,
    this.readOnly = false,
    required this.controller,
    this.onTap, this.errorText,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
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
      cursorColor: ColorsApp.blue106,
      readOnly: widget.readOnly,
      maxLines: 1,
      decoration: InputDecoration(
        helperStyle: TextStyle(color: Colors.amber) , //спробувати !
        suffixIcon: widget.addObscureText
            ? InkWell(
                onTap: changeVisibilityText,
                child: selectedVisibilityIcon,
              )
            : null,
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorsApp.blue106,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorsApp.grey97,
          ),
        ),
        labelText: widget.labelText,
        labelStyle: interTextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          color: ColorsApp.grey97,
        ),
        focusColor: Colors.amber ,// спробувати ! 
        floatingLabelStyle: interTextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          color: ColorsApp.blue106,
        ),
        errorText: widget.errorText, 
      ),
      onTap: widget.onTap,
    );
  }
}
