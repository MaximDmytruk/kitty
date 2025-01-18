import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:kitty/cubit/user_cubit.dart';
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
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();

  void createAccountAction() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        repeatPasswordController.text.isEmpty) {
          print('Go exit =================================');
      
      return;
      
    }

    final String password = passwordController.text;
    final String repeatPassword = repeatPasswordController.text;

    if (password == repeatPassword) {
      context.read<UserCubit>().registerUser(
            passwordController.text,
            emailController.text,
            nameController.text,
          );
    } else {}
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    repeatPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle(
    //     statusBarColor: Colors.grey,
    //     statusBarIconBrightness: Brightness.dark,
    //   ),
    // );

    // BlocProvider(
    //   create: (context) => UserCubit(),
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
                    controller: nameController,
                    labelText: AppLocale.name.getString(context),
                  ),
                  KittyTextfield(
                    controller: emailController,
                    labelText: AppLocale.enterYourEmail.getString(context),
                  ),
                  KittyTextfield(
                    controller: passwordController,
                    labelText: AppLocale.password.getString(context),
                    addObscureText: true,
                  ),
                  KittyTextfield(
                    controller: repeatPasswordController,
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
