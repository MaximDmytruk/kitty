import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:kitty/localization/app_locale.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';

class NameOfScreenHeader extends StatelessWidget {
  final String name;
  final Color color;

  const NameOfScreenHeader({
    super.key,
    required this.name,  this.color = KittyColors.lightGrey238,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 48.0,
      automaticallyImplyLeading: false,
      backgroundColor: color,
      title: Padding(
        padding: EdgeInsets.only(bottom: 18.0),
        child: Text(
          name,
          style: interTextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
            color: KittyColors.grey66,
          ),
        ),
      ),
    );
  }
}
