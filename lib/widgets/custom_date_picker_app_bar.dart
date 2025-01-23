import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../styles/colors/colors_app.dart';
import '../styles/font/fontstyle_app.dart';
import '../styles/icons/icons_app.dart';

class CustomDatePickerAppBar extends StatefulWidget {
  const CustomDatePickerAppBar({super.key});

  @override
  State<CustomDatePickerAppBar> createState() => _CustomDatePickerAppBarState();
}

class _CustomDatePickerAppBarState extends State<CustomDatePickerAppBar> {
  String selectedMonth = 'May';
  String selectedYear = '2021';

  void rightDateAction() {}
  void datePickerAction() {}
  void leftDateAction() {}
  @override
  Widget build(BuildContext context) {

    //TODO: переробити на строку
    return AppBar(
      toolbarHeight: 48.0,
      backgroundColor: ColorsApp.white,
      // centerTitle: true,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: leftDateAction,
            icon: SvgPicture.asset(
              IconsApp.left,
              width: 24.0,
              height: 24.0,
            ),
          ),
          ElevatedButton(
              onPressed: datePickerAction,
              // style: ElevatedButton.styleFrom(
              //   backgroundColor: KittyColors.lightGrey245,
              //   foregroundColor: KittyColors.grey66,
              //   shadowColor: KittyColors.transparent,
              //   elevation: 0.0,
              // ),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  ColorsApp.lightGrey245,
                ),
                foregroundColor: WidgetStatePropertyAll(
                  ColorsApp.grey66,
                ),
                elevation: WidgetStatePropertyAll(0.0),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    IconsApp.calendar,
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    '$selectedMonth, $selectedYear',
                    style: interTextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: ColorsApp.grey66,
                    ),
                  )
                ],
              )),
          IconButton(
            onPressed: rightDateAction,
            icon: SvgPicture.asset(
              IconsApp.right,
              width: 24.0,
              height: 24.0,
            ),
          ),
        ],
      ),
    );
  }
}
