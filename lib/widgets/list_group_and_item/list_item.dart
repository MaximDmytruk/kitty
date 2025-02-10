import 'package:flutter/material.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';
import 'package:kitty/widgets/icons/category_icon.dart';

class ListItem extends StatelessWidget {
  final String firstName;
  final String secondName;
  final int value;
  final int? secondValue;
  final String iconPath;
  final Color colorIconBackground;

  const ListItem({
    super.key,
    required this.firstName,
    required this.secondName,
    required this.value,
    this.secondValue,
    required this.iconPath,
    required this.colorIconBackground,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8.0,
      children: [
        CategoryIcon(
          color: colorIconBackground,
          iconPath: iconPath,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              firstName,
              style: interTextStyle(),
            ),
            Text(
              secondName,
              style: interTextStyle(
                fontSize: 12.0,
                color: ColorsApp.grey97,
              ),
            ),
          ],
        ),
        Spacer(),
        Text(
          value.toString(),
          style: interTextStyle(
            color: ColorsApp.red,
          ),
        )
      ],
    );
  }
}
