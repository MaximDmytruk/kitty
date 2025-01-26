import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';

class ListItem extends StatelessWidget {
  final String firstName;
  final String secondName;
  final int value;
  final int? secondValue;
  final String iconAssetName;
  final Color iconBackground;

  const ListItem({
    super.key,
    required this.firstName,
    required this.secondName,
    required this.value,
    this.secondValue,
    required this.iconAssetName,
    required this.iconBackground,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8.0,
      children: [
        Container(
          height: 40.0,
          width: 40.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: iconBackground,
          ),
          child: SvgPicture.asset(
            iconAssetName,
            height: 24.0,
            width: 24.0,
            fit: BoxFit.none,
          ),
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
