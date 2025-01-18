import 'package:flutter/material.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';
import 'package:kitty/widgets/list_item.dart';

class ListGroup extends StatelessWidget {
  const ListGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 16.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            8.0,
          ),
          border: Border.all(
            color: KittyColors.lightGrey224,
          ),
        ),
        child: Column(
          spacing: 12.0,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'data'.toUpperCase(),
                  style: interTextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.w500,
                    color: KittyColors.grey66,
                  ),
                ),
                Text(
                  '-1125',
                  style: interTextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.w500,
                    color: KittyColors.grey66,
                  ),
                ),
              ],
            ),
            ListItem(),
            ListItem(),
            ListItem(),
          ],
        ),
      ),
    );
  }
}
