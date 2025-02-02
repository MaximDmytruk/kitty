import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';
import 'package:kitty/styles/icons/icons_app.dart';
import 'package:kitty/widgets/buttons/custom_text_button.dart';

class CategoryIconRow extends StatelessWidget {
  final String name;
  final Function editOnPressed;
 
  final Widget icon;
  final Color iconColor;

  const CategoryIconRow({
    super.key,
    required this.editOnPressed,
    required this.name,
    required this.icon,
    required this.iconColor,
  
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        spacing: 8.0,
        children: [
          Container(
            height: 40.0,
            width: 40.0,
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: iconColor,
              shape: BoxShape.circle,
            ),
            child: icon,
          ),
          Text(
            name,
            style: interTextStyle(
              fontSize: 14.0,
              color: ColorsApp.black,
            ),
          ),
          Spacer(),
          CustomTextButton(
            onPressed: editOnPressed,
            name: 'Edit',
          ),
          IconButton(
            iconSize: 10.0,
            onPressed: (){},
            icon: SvgPicture.asset(
              IconsApp.dragIndicator,
            ),
          ),
        ],
      ),
    );
  }
}
