import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';
import 'package:kitty/styles/icons/category_icons.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
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
            color: Color.fromRGBO(200, 230, 201, 1),
          ),
          child: SvgPicture.asset(
            CategoryIcons.education,
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
              'Notes will come here',
              style: interTextStyle(),
            ),
            Text(
              'Category name',
              style: interTextStyle(
                fontSize: 12.0,
                color: KittyColors.grey97,
              ),
            ),
          ],
        ),
        Spacer(),
        Text(
          '-500',
          style: interTextStyle(
            color: KittyColors.red,
          ),
        )
      ],
    );
  }
}
