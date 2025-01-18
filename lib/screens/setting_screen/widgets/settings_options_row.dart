import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';

import '../../../styles/icons/icons_app.dart';

class SettingOptionsRow extends StatefulWidget {
  final String leadingIconName;
  final String name;
  final Function onTap;

  const SettingOptionsRow({
    super.key,
    required this.leadingIconName,
    required this.name,
    required this.onTap,
  });

  @override
  State<SettingOptionsRow> createState() => _SettingOptionsRowState();
}

class _SettingOptionsRowState extends State<SettingOptionsRow> {
  void _onTap() {
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 12.0,
        ),
        child: Row(
          spacing: 8.0,
          children: [
            SvgPicture.asset(
              widget.leadingIconName,
              width: 24.0,
              height: 24.0,
            ),
            Text(
              widget.name,
              style: interTextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: KittyColors.black,
              ),
            ),
            Spacer(),
            SvgPicture.asset(
              IconsApp.right,
              width: 12.0,
              height: 12.0,
            ),
          ],
        ),
      ),
    );
  }
}
