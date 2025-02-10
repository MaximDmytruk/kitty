import 'package:flutter/material.dart';

import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:kitty/localization/app_locale.dart';

import 'package:kitty/screens/statistics_screen/widgets/name_of_section.dart';
import 'package:kitty/styles/icons/category_icons.dart';
import 'package:kitty/styles/icons/icons_app.dart';
import 'package:kitty/widgets/buttons/custom_feeled_button.dart';
import 'package:kitty/widgets/list_group_and_item/list_item.dart';
import 'package:kitty/widgets/app_bars/name_of_screen_header.dart';
import 'package:kitty/widgets/date_picker/custom_date_picker.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/widgets/app_bars/custom_status_bar.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  void dowloadReportActiom() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomStatusBar(),
              NameOfScreenHeader(
                name: AppLocale.statistics.getString(context),
                color: ColorsApp.white,
              ),
              CustomDatePicker(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16.0,
                ),
                child: NameOfSection(
                  name: AppLocale.overview.getString(context),
                ),
              ),
              //TODO: Кольоровий графіка
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Container(
                  height: 36.0,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(248, 187, 207, 1),
                  ),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: NameOfSection(name: AppLocale.detail.getString(context)),
              ),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  itemCount: 8,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 8.0,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return ListItem(
                      firstName: 'Notes will come here',
                      secondName: 'Category name',
                      value: -500,
                      iconPath: CategoryIcons.bar,
                      colorIconBackground: ColorsApp.pink225,
                    );
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 16.0,
            ),
            child: CustomFeeledButton(
              onPressed: dowloadReportActiom,
              name: AppLocale.download.getString(context),
              icon: SvgPicture.asset(IconsApp.download),
            ),
          )
        ],
      ),
    );
  }
}
