import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty/screens/setting_screen/widgets/settings_options_row.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';
import 'package:kitty/styles/icons/icons_app.dart';

import 'package:kitty/widgets/kitty_status_bar.dart';

import '../widgets/settings_app_bar.dart';
import '../widgets/user_header_settings.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String name = 'John Doe';
  // String firstChar = name.substring(0, 1); TODO чому так не працює ?
  String email = 'john.doe@gmail.com';
  late String firstChar;

  void manageCategoriesAction() {}
  void exportToPDFAction() {}
  void chooseCurrencyAction() {}
  void chooseLanguageAction() {}
  void questionsAction() {}
  void logoutAction() {}

  @override
  void initState() {
    firstChar = name.substring(0, 1).toUpperCase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KittyColors.white,
      body: Column(
        children: [
          StatusBar(),
          SettingAppBar(),
          UserHeaderSetting(firstChar: firstChar, name: name, email: email),
          SettingOptionsRow(
              leadingIconName: KittyIcons.category,
              name: 'Manage categories',
              onTap: manageCategoriesAction),
          SettingOptionsRow(
              leadingIconName: KittyIcons.pdf,
              name: 'Export to PDF',
              onTap: exportToPDFAction),
          SettingOptionsRow(
              leadingIconName: KittyIcons.translate,
              name: 'Choose language',
              onTap: chooseLanguageAction),
          SettingOptionsRow(
              leadingIconName: KittyIcons.category,
              name: 'Frequently asked questions',
              onTap: questionsAction),
          SettingOptionsRow(
              leadingIconName: KittyIcons.logout,
              name: 'Logout',
              onTap: logoutAction),
        ],
      ),
    );
  }
}
