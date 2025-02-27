import 'package:flutter/material.dart';

import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';


class NameOfScreenHeader extends StatelessWidget {
  final String name;
  final Color backgroundColor;
  final Widget? widgetOnRightSide;

  const NameOfScreenHeader({
    super.key,
    required this.name,
    this.backgroundColor = ColorsApp.lightGrey238,
    this.widgetOnRightSide,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 12.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // SizedBox(
            //   height: 48.0,
            //   width: 16.0,
            // ),
            Text(
              name,
              style: interTextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                color: ColorsApp.grey66,
              ),
            ),
            if (widgetOnRightSide != null) widgetOnRightSide!
          ],
        ),
      ),
    );
  }
}
