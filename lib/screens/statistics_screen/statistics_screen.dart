import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:kitty/localization/app_locale.dart';
import 'package:kitty/widgets/name_of_screenHeader.dart';
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
      backgroundColor: KittyColors.white,
      body: Column(
        children: [
          CustomStatusBar(),
          NameOfScreenHeader(
            name: AppLocale.statistics.getString(context),
            color: KittyColors.white,
          ),
          CustomDatePickerAppBar(),
        ],
      ),
    );
  }
}
