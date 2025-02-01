import 'package:flutter/material.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';

class NameOfScreenHeader extends StatelessWidget {
  final String name;
  final Color color;

  const NameOfScreenHeader({
    super.key,
    required this.name,
    this.color = ColorsApp.lightGrey238,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: color,
      child: Row(
        children: [
          SizedBox(
            height: 48.0,
            width: 16.0,
          ),
          Text(
            name,
            style: interTextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              color: ColorsApp.grey66,
            ),
          )
        ],
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {

  //   return AppBar(
  //     toolbarHeight: 48.0,
  //     automaticallyImplyLeading: false,
  //     backgroundColor: color,
  //     title: Padding(
  //       padding: EdgeInsets.only(bottom: 18.0),
  //       child: Text(
  //         name,
  //         style: interTextStyle(
  //           fontSize: 20.0,
  //           fontWeight: FontWeight.w700,
  //           color: ColorsApp.grey66,
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
