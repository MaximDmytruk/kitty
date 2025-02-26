import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';
import 'package:kitty/styles/icons/icons_app.dart';

import '../../styles/colors/colors_app.dart';

class CustomHomeAppBar extends StatefulWidget {
  final String firstLetter;
  final Function searchAction;
  final Function? userAction;

  const CustomHomeAppBar({
    super.key,
    required this.searchAction,
    this.userAction,
    required this.firstLetter,
  });

  @override
  State<CustomHomeAppBar> createState() => _CustomHomeAppBarState();
}

class _CustomHomeAppBarState extends State<CustomHomeAppBar> {
  void userAction() {}

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsApp.white,
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0, //Щоб не змінювався колір під час скролу
      title: Row(
        children: [
          SvgPicture.asset(
            IconsApp.logoKitty,
            width: 40.0,
            height: 40.0,
          ),
          SizedBox(
            width: 8.0,
          ),
          Text(
            'Kitty',
            style: interTextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              color: ColorsApp.grey66,
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () => widget.searchAction(),
            icon: SvgPicture.asset(
              IconsApp.search,
            ),
          ),
          SizedBox(width: 8.0),
          InkWell(
            borderRadius: BorderRadius.circular(25.0),
            onTap: userAction,
            child: Container(
              height: 32.0,
              width: 32.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(25.0),
                color: ColorsApp.lightGrey238,
              ),
              child: Center(
                child: Text(
                  widget.firstLetter,
                  style: interTextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: ColorsApp.grey66,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
