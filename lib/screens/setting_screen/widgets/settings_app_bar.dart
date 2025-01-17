import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:kitty/localization/app_locale.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';

class SettingAppBar extends StatelessWidget {
  const SettingAppBar({
    super.key,
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
          AppLocale.settings.getString(context),
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
