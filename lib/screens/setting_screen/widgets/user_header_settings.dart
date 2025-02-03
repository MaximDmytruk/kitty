import 'package:flutter/material.dart';
import 'package:kitty/widgets/icons/letter_avatar.dart';

import '../../../styles/colors/colors_app.dart';
import '../../../styles/font/fontstyle_app.dart';

class UserHeaderSetting extends StatelessWidget {
  final String firstChar;
  final String name;
  final String email;

  const UserHeaderSetting({
    super.key,
    required this.firstChar,
    required this.name,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88.0,
      color: ColorsApp.lightGrey238,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          bottom: 16,
        ),
        child: Row(
          spacing: 8.0,
          children: [
            LetterAvatar(
              firstChar: firstChar,
              backgroundColor: ColorsApp.white,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: interTextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: ColorsApp.black,
                  ),
                ),
                Text(
                  email,
                  style: interTextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    color: ColorsApp.grey66,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
