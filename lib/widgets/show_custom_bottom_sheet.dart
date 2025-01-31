import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:kitty/services/localization/app_locale.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';

import 'package:kitty/widgets/custom_outline_button.dart';

Future<dynamic> showCustomBottomSheet({
  required String nameHeader,
  required BuildContext context,
  required int length,
  required Widget? Function(BuildContext context, int index) itemBuilder,
  Function()? onPressed,
  String? buttonName,
}) {
  return showModalBottomSheet(
    context: context,
    isDismissible: true,
    barrierColor: ColorsApp.transparent,
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.1),
                spreadRadius: 0,
                blurRadius: 8,
                offset: Offset(0, -1),
              ),
            ],
            color: ColorsApp.lightGrey250,
            borderRadius: BorderRadius.circular(20.0)),
        height: 400,
        child: Column(
          spacing: 16,
          children: [
            SizedBox(
              height: 8.0,
            ),
            Text(
              nameHeader,
              style: interTextStyle(
                  fontSize: 10.0,
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
            if (onPressed != null)
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 16.0,
                ),
                child: CustomOutlineButton(
                  onPressed: onPressed,
                  buttonName: buttonName,
                ),
              ),
          ],
        ),
      );
    },
  );
}
