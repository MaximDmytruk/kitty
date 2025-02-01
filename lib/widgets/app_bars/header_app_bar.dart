import 'package:flutter/material.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';

class HeaderAppBar extends StatelessWidget {
  final String name;
  const HeaderAppBar({
    super.key,
    required this.name,
  });

  void onTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.0,
      color: ColorsApp.lightGrey245,
      child: Row(
        spacing: 16.0,
        children: [
          SizedBox(
            width: 0.0,
          ),
          InkWell(
              onTap: () {
                onTap(context);
              },
              child: Icon(Icons.arrow_back)),
          Text(
            name,
            style: interTextStyle(
              fontSize: 16.0,
              color: ColorsApp.grey66,
            ),
          ),
        ],
      ),
    );

    // return AppBar(
    //   backgroundColor: ColorsApp.lightGrey245,
    //   title: Text(
    //     name,
    //     style: interTextStyle(
    //       fontSize: 16.0,
    //       color: ColorsApp.grey66,
    //     ),
    //   ),
    // );
  }
}
