import 'package:flutter/material.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';

class ListGroup extends StatelessWidget {
  const ListGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Row(
            children: [
              Container(
                height: 40.0,
                width: 40.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: KittyColors.green,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
