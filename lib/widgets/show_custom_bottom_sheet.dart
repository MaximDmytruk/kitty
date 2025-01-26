import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:kitty/localization/app_locale.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';

Future<dynamic> showCustomModalBottomSheet(
  BuildContext context,
  int length,
  Widget? Function(BuildContext, int) itemBuilder,
) {
  return showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 400,
        color: ColorsApp.lightGrey250,
        child: Column(
          spacing: 16,
          children: [
            SizedBox(
              height: 8.0,
            ),
            Text(
              AppLocale.chooseCategory.getString(context),
              style: interTextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: ColorsApp.grey66),
            ),
            Flexible(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 24.0,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemCount: length,
                itemBuilder: itemBuilder,
              ),
            ),
          ],
        ),
      );
    },
  );
}
