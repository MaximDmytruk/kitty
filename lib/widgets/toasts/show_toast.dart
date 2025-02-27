import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';

void showToast({required String text}) {
  BotToast.showCustomText(
    align: Alignment.topCenter,
    toastBuilder: (_) {
      return Padding(
        padding: const EdgeInsets.only(
          top: 120.0,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          color: ColorsApp.grey66,
          child: Text(
            text,
            style: interTextStyle(
              fontWeight: FontWeight.w500,
              color: ColorsApp.white,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );
    },
  );
}
