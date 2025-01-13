import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:kitty/localization/app_locale.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';
import 'package:kitty/widgets/kitty_feeled_button.dart';

import '../../widgets/kitty_texfield.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  static const String routeName = '/registration_screen';

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  void createAccountAction() {}

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle(
    //     statusBarColor: Colors.grey,
    //     statusBarIconBrightness: Brightness.dark,
    //   ),
    // );
    return Scaffold(
      backgroundColor: KittyColors.lightGrey250,
      body: Column(
        children: [
          Container(
            color: KittyColors.grey33WithOpacity,
            height: MediaQuery.of(context).padding.top,
          ),
          AppBar(
            backgroundColor: KittyColors.lightGrey245,
            toolbarHeight: 48.0,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                spacing: 12,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      AppLocale.createAccount.getString(context),
                      style: interTextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.w500,
                        color: KittyColors.grey66,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      AppLocale.pleaseEnterYourDetails.getString(context),
                      style: interTextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: KittyColors.grey66,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  KittyTextfield(
                    labelText: AppLocale.name.getString(context),
                  ),
                  KittyTextfield(
                    labelText: AppLocale.enterYourEmail.getString(context),
                  ),
                  KittyTextfield(
                    labelText: AppLocale.password.getString(context),
                    addObscureText: true,
                  ),
                  KittyTextfield(
                    labelText: AppLocale.repeatPassword.getString(context),
                    addObscureText: true,
                  ),
                  Center(
                    child: KittyFeeledButton(
                      onPressed: createAccountAction,
                      name: AppLocale.createAccount.getString(context),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
