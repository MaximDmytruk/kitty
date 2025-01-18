import 'package:flutter/material.dart';

import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';


class TotalAmountIcon extends StatelessWidget {
  final int value;
  final Color color;
  final String name;
  final StatelessWidget icon;
  const TotalAmountIcon({
    super.key,
    required this.value,
    required this.color,
    required this.icon, required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        icon,
        Text(
          value.toString(),
          style: interTextStyle(
              fontWeight: FontWeight.w500, color: color),
        ),
        Text(
          name,
          style: interTextStyle(
            fontSize: 12.0,
            color: KittyColors.grey97,
          ),
        )
      ],
    );
  }
}
