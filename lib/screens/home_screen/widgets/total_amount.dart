import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kitty/localization/app_locale.dart';
import 'package:kitty/screens/home_screen/widgets/total_amount_icon.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/icons/icons_app.dart';

class TotalAmount extends StatelessWidget {
  const TotalAmount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 16.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          8.0,
        ),
        border: Border.all(
          color: ColorsApp.lightGrey224,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TotalAmountIcon(
            value: -12000,
            color: ColorsApp.red,
            name: AppLocale.expenses.getString(context),
            icon: SvgPicture.asset(
              IconsApp.income,
            ),
          ),
          TotalAmountIcon(
            value: 48000,
            color: ColorsApp.green,
            name:AppLocale.balance.getString(context),
            icon: SvgPicture.asset(
              IconsApp.income,
            ),
          ),
          TotalAmountIcon(
            value: 70000,
            color: ColorsApp.black,
            name: AppLocale.income.getString(context),
            icon: SvgPicture.asset(
              IconsApp.income,
            ),
          ),
        ],
      ),
    );
  }
}