import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../styles/colors/colors_app.dart';
import '../styles/font/fontstyle_app.dart';
import '../styles/icons/icons_app.dart';

class KittyDatePickerAppBar extends StatefulWidget {
  const KittyDatePickerAppBar({super.key});

  @override
  State<KittyDatePickerAppBar> createState() => _KittyDatePickerAppBarState();
}

class _KittyDatePickerAppBarState extends State<KittyDatePickerAppBar> {
  String selectedMonth = 'May';
  String selectedYear = '2021';

  void rightDateAction() {}
  void datePickerAction() {}
  void leftDateAction() {}
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 48.0,
      backgroundColor: KittyColors.white,
      // centerTitle: true,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: leftDateAction,
            icon: SvgPicture.asset(
              KittyIcons.left,
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
                  KittyColors.lightGrey245,
                ),
                foregroundColor: WidgetStatePropertyAll(
                  KittyColors.grey66,
                ),
                elevation: WidgetStatePropertyAll(0.0),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    KittyIcons.calendar,
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    '$selectedMonth, $selectedYear',
                    style: interTextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: KittyColors.grey66,
                    ),
                  )
                ],
              )),
          IconButton(
            onPressed: rightDateAction,
            icon: SvgPicture.asset(
              KittyIcons.right,
              width: 24.0,
              height: 24.0,
            ),
          ),
        ],
      ),
    );
  }
}
