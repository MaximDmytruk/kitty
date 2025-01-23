import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kitty/localization/app_locale.dart';
import 'package:kitty/screens/statistics_screen/widgets/name_of_section.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';
import 'package:kitty/styles/icons/category_icons.dart';
import 'package:kitty/widgets/list_item.dart';
import 'package:kitty/widgets/name_of_screen_header.dart';
import 'package:kitty/widgets/custom_date_picker_app_bar.dart';

import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/widgets/custom_status_bar.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomStatusBar(),
          NameOfScreenHeader(
            name: AppLocale.statistics.getString(context),
            color: ColorsApp.white,
          ),
          CustomDatePickerAppBar(),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0,
            ),
            child: NameOfSection(
              name: AppLocale.overview.getString(context),
            ),
          ),
          Container(
            height: 36.0,
            decoration: BoxDecoration(
              color: Color.fromRGBO(248, 187, 207, 1),
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          Expanded(
            child: ListView(
              
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
              
              ),
              children: [
                NameOfSection(name: AppLocale.detail.getString(context)),
                ListItem(
                  firstName: 'Notes will come here',
                  secondName: 'Category name',
                  value: -500,
                  iconAssetName: CategoryIcons.electronics,
                  iconBackground: ColorsApp.lightBlue178,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
