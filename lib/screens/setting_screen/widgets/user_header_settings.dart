import 'package:flutter/material.dart';

import '../../../styles/colors/colors_app.dart';
import '../../../styles/font/fontstyle_app.dart';

class UserHeaderSetting extends StatelessWidget {
  const UserHeaderSetting({
    super.key,
    required this.firstChar,
    required this.name,
    required this.email,
  });

  final String firstChar;
  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88.0,
      color: KittyColors.lightGrey238,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16),
        child: Row(
          spacing: 8.0,
          children: [
            Container(
              width: 48.0,
              height: 48.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: KittyColors.white,
              ),
              child: Center(
                child: Text(
                  firstChar,
                  style: interTextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: KittyColors.grey66,
                  ),
                ),
              ),
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
                    color: KittyColors.black,
                  ),
                ),
                Text(
                  email,
                  style: interTextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    color: KittyColors.grey66,
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
