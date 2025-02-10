import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';

class CategoryIcon extends StatelessWidget {
  final Color color;
  final String iconPath;
  final String? name;

  const CategoryIcon({
    super.key,
    required this.color,
    required this.iconPath,
    this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4.0,
      children: [
        Container(
          height: 40.0,
          width: 40.0,
          padding: EdgeInsets.all(
            10.0,
          ),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(iconPath),
        ),
        if (name != null)
          Text(
            name ?? '',
            style: interTextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: ColorsApp.grey66,
            ),
          ),
      ],
    );
  }
}
