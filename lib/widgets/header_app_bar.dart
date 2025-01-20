import 'package:flutter/material.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';

class HeaderAppBar extends StatelessWidget {
  final String name;

  const HeaderAppBar({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 48.0,
      automaticallyImplyLeading: false,
      backgroundColor: KittyColors.lightGrey238,
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
