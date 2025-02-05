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
    this.onTap,
    this.errorText,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool obscureText = false;

  final Icon _visibility = Icon(Icons.visibility);
  final Icon _visibilityOff = Icon(Icons.visibility_off);
  Icon _selectedVisibilityIcon = Icon(Icons.visibility_off);
  final FocusNode _focusNode = FocusNode();
  Color labelColor = ColorsApp.grey97;

  void changeVisibilityText() {
    if (obscureText == false) {
      _selectedVisibilityIcon = _visibilityOff;
      obscureText = true;
    } else {
      _selectedVisibilityIcon = _visibility;
      obscureText = false;
    }
    setState(() {});
  }

  @override
  void initState() {
    obscureText = widget.addObscureText;
    _focusNode.addListener(_removeLis);
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.removeListener(_removeLis);
    _focusNode.dispose();
    super.dispose();
  }

  void _removeLis() {
    if (_focusNode.hasFocus) {
      setState(() {
        labelColor = ColorsApp.blue106;
      });
    } else {
      setState(() {
        labelColor = ColorsApp.grey97;
      });
    }
  }
  //TODO: disspose!!!!

  //TODO:remove all

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: _focusNode,
      keyboardAppearance: Brightness.dark,
      controller: widget.controller,
      obscureText: obscureText,
      cursorColor: ColorsApp.blue106,
      readOnly: widget.readOnly,
      maxLines: 1,
      decoration: InputDecoration(
        suffixIcon: widget.addObscureText
            ? InkWell(
                onTap: changeVisibilityText,
                child: _selectedVisibilityIcon,
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
        floatingLabelStyle: interTextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          color: widget.errorText == null ? labelColor : ColorsApp.red,
        ),
        errorText: widget.errorText,
      ),
      onTap: widget.onTap,
    );
  }
}
