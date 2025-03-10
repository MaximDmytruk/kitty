import 'package:flutter/material.dart';

import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty/utils/localization/app_locale.dart';
import 'package:kitty/screens/statistics_screen/screen/statistics_screen.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/icons/icons_app.dart';

import '../home_screen/screen/home_screen.dart';
import '../setting_screen/screen/setting_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  static const String routeName = 'bottom_navigation_screen';

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedPage = 1;

  void onSelectedTab(int index) {
    if (_selectedPage == index) return;
    setState(() {
      _selectedPage = index;
    });
  }

  Widget _getScreen(int index) {
  switch (index) {
    case 0:
      return const StatisticScreen();
    case 1:
      return const HomeScreen();
    case 2:
      return const SettingScreen();
    default:
      return const HomeScreen();
  }
}

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Center(child: _getScreen(_selectedPage)),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          items: [
            BottomNavigationBarItem(
              icon: _selectedPage == 0
                  ? SvgPicture.asset(IconsApp.reportSelected)
                  : SvgPicture.asset(IconsApp.report),
              label: AppLocale.report.getString(context),
            ),
            BottomNavigationBarItem(
              icon: _selectedPage == 1
                  ? SvgPicture.asset(
                      IconsApp.homeSelected,
                    )
                  : SvgPicture.asset(IconsApp.home),
              label: AppLocale.home.getString(context),
            ),
            BottomNavigationBarItem(
              icon: _selectedPage == 2
                  ? SvgPicture.asset(IconsApp.settingSelected)
                  : SvgPicture.asset(IconsApp.setting),
              label: AppLocale.settings.getString(context),
            ),
          ],
          selectedItemColor: ColorsApp.grey66,
          backgroundColor: ColorsApp.white,
          onTap: onSelectedTab,
        ),
      );
  }
}
