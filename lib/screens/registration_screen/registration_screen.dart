import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:kitty/blocs/user_cubit/user_cubit.dart';
import 'package:kitty/localization/app_locale.dart';
import 'package:kitty/screens/bottom_navigation_screen/bottom_navigation_screen.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';
import 'package:kitty/widgets/buttons/custom_feeled_button.dart';
import '../../widgets/text_fields/custom_texfield.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  static const String routeName = '/registration_screen';

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String? errorTexts;

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
    } else {
      setState(() {
        errorTexts = 'Not the same password';
      });
    }
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
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      backgroundColor: ColorsApp.lightGrey250,
      body: BlocListener<UserCubit, UserState>(
        listener: (context, state) {
          if (state.status == UserStatus.authenticated) {
            Navigator.of(context).pushNamed(BottomNavigationScreen.routeName);
          }

        },
        child: ListView(
          children: [
            AppBar(
              backgroundColor: ColorsApp.lightGrey250,
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
                          color: ColorsApp.grey66,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        AppLocale.pleaseEnterYourDetails.getString(context),
                        style: interTextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: ColorsApp.grey66,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    CustomTextfield(
                      controller: nameController,
                      labelText: AppLocale.name.getString(context),
                    ),
                    CustomTextfield(
                      controller: emailController,
                      labelText: AppLocale.enterYourEmail.getString(context),
                    ),
                    CustomTextfield(
                      controller: passwordController,
                      labelText: AppLocale.password.getString(context),
                      addObscureText: true,
                    ),
                    CustomTextfield(
                      controller: repeatPasswordController,
                      labelText: AppLocale.repeatPassword.getString(context),
                      addObscureText: true,
                      errorText: errorTexts,
                    ),
                    Center(
                      child: CustomFeeledButton(
                        onPressed: createAccountAction,
                        name: AppLocale.createAccount.getString(context),
                      ),
                    ),
                    Center(
                      child: BlocBuilder<UserCubit, UserState>(
                        builder: (context, state) {
                          if (state.status == UserStatus.error) {
                            return Text(
                              state.errorText ?? 'ssssss',
                              style: interTextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                color: ColorsApp.red,
                              ),
                            );
                          }
                          return SizedBox.shrink();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
