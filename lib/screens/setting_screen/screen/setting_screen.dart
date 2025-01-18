import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:kitty/cubit/user_cubit.dart';
import 'package:kitty/model/user_model.dart';

import 'package:kitty/screens/setting_screen/widgets/settings_options_row.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/icons/icons_app.dart';
import 'package:kitty/widgets/custom_status_bar.dart';
import '../../../localization/app_locale.dart';
import '../widgets/settings_app_bar.dart';
import '../widgets/user_header_settings.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final FlutterLocalization _localization = FlutterLocalization.instance;
 
  void manageCategoriesAction() {}
  void exportToPDFAction() {}
  void chooseCurrencyAction() {}

  void chooseLanguageAction() {
    if (_localization.currentLocale.toString() == 'en') {
      _localization.translate('ua');
    } else {
      _localization.translate('en');
    }
  }

  void questionsAction() {}
  void logoutAction() {}

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KittyColors.white,
      body: Column(
        children: [
          CustomStatusBar(),
          SettingAppBar(),
          BlocBuilder<UserCubit, User?>(
            builder: (context, user) {
              if (user != null) {
                String firstChar = user.name.substring(0, 1).toUpperCase();
                return UserHeaderSetting(
                  firstChar: firstChar,
                  name: user.name,
                  email: user.email,
                );
              } else {
                return UserHeaderSetting(
                  firstChar: '0',
                  name: 'NONAME',
                  email: 'NOEMAIL',
                );
              }
            },
          ),
          SettingOptionsRow(
            leadingIconName: IconsApp.category,
            name: AppLocale.manageCategories.getString(context),
            onTap: manageCategoriesAction,
          ),
          SettingOptionsRow(
            leadingIconName: IconsApp.pdf,
            name: AppLocale.toPDF.getString(context),
            onTap: exportToPDFAction,
          ),
          SettingOptionsRow(
            leadingIconName: IconsApp.translate,
            name: AppLocale.chooseLanguage.getString(context),
            onTap: chooseLanguageAction,
          ),
          SettingOptionsRow(
            leadingIconName: IconsApp.category,
            name: AppLocale.frequentlyAskedQuestions.getString(context),
            onTap: questionsAction,
          ),
          SettingOptionsRow(
            leadingIconName: IconsApp.logout,
            name: AppLocale.logout.getString(context),
            onTap: logoutAction,
          ),
        ],
      ),
    );
  }
}
