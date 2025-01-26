import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:kitty/cubit/user_cubit.dart';
import 'package:kitty/widgets/name_of_screen_header.dart';
import 'package:kitty/screens/setting_screen/widgets/settings_options_row.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/icons/icons_app.dart';
import 'package:kitty/widgets/custom_status_bar.dart';
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
    userName = context.read<UserCubit>().getUserName();
    firstChar = context.read<UserCubit>().getFirstLetterName();
    userEmail = context.read<UserCubit>().getUserEmail();
    super.initState();
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
          //TODO:
          // BlocBuilder<UserCubit, UserState>(
          //   builder: (context, state) {
          //     return state.when(
          //       initial: () => UserHeaderSetting(
          //         firstChar: '',
          //         name: 'NO Name',
          //         email: "No Email",
          //       ),
          //       authenticated: (user) => UserHeaderSetting(
          //         firstChar: user.name.substring(0, 1).toUpperCase(),
          //         name: user.name,
          //         email: user.email,
          //       ),
          //       error: (error) => UserHeaderSetting(
          //         firstChar: 'E',
          //         name: "Error",
          //         email: 'Error',
          //       ),
          //     );
          //   },
          // ),
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
