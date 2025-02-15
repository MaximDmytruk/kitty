import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:kitty/blocs/user_cubit/user_cubit.dart';
import 'package:kitty/screens/auth_screen/auth_screen.dart';
import 'package:kitty/screens/manage_categories_screen/screen/manage_categories_screen.dart';
import 'package:kitty/widgets/app_bars/name_of_screen_header.dart';
import 'package:kitty/screens/setting_screen/widgets/settings_options_row.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/icons/icons_app.dart';
import 'package:kitty/widgets/app_bars/custom_status_bar.dart';
import '../../../localization/app_locale.dart';

import '../widgets/user_header_settings.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final FlutterLocalization _localization = FlutterLocalization.instance;
  late String userName;
  late String firstChar;
  late String userEmail;

  @override
  void initState() {
    print('SETTING SCREEN');
    userName = context.read<UserCubit>().getUserName();
    firstChar = context.read<UserCubit>().getFirstLetterName();
    userEmail = context.read<UserCubit>().getUserEmail();
    super.initState();
  }

  void manageCategoriesAction() => Navigator.of(
        context,
      ).pushNamed(
        ManageCategoriesScreen.routeName,
      );

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
  void logoutAction() {
    Navigator.popAndPushNamed(context, AuthScreen.routeName);
  }

  void removeUser() {
    context.read<UserCubit>().removeUser();
    Navigator.popAndPushNamed(context, AuthScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.white,
      body: Column(
        children: [
          CustomStatusBar(),
          NameOfScreenHeader(
            name: AppLocale.settings.getString(context),
            // color: KittyColors.lightGrey238,
          ),
          UserHeaderSetting(
            firstChar: firstChar,
            name: userName,
            email: userEmail,
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
          SettingOptionsRow(
            leadingIconName: IconsApp.logoKitty,
            name: 'delete user',
            onTap: removeUser,
          ),
        ],
      ),
    );
  }
}
