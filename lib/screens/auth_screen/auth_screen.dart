import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty/blocs/user_cubit/user_cubit.dart';
import 'package:kitty/screens/bottom_navigation_screen/bottom_navigation_screen.dart';
import 'package:kitty/utils/localization/app_locale.dart';
import 'package:kitty/screens/registration_screen/registration_screen.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/icons/icons_app.dart';

import '../../utils/local_auth.dart';
import '../../styles/font/fontstyle_app.dart';
import '../../widgets/buttons/custom_feeled_button.dart';
import '../../widgets/text_fields/custom_texfield.dart';
import '../../widgets/buttons/custom_text_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  static const String routeName = '/auth_screen';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _logInAction() {
    String? loginText = loginController.text;
    String passwordText = passwordController.text;

    if (loginText.isEmpty || passwordText.isEmpty) {
      return;
    }

    context.read<UserCubit>().loginUser(loginText, passwordText);
  }

  void _signUp() =>
      Navigator.of(context).pushNamed(RegistrationScreen.routeName);

  void _authenticationAction() async {
    final bool authenticate = await LocalAuth.authenticate();
    if (mounted) {
      context.read<UserCubit>().authUser(authenticate);
    }
  }

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.lightGrey250,
      body: BlocListener<UserCubit, UserState>(
        listener: (context, state) {
          if (state.status == UserStatus.authenticated) {
            Navigator.of(context).pushNamed(
              BottomNavigationScreen.routeName,
            );
          }
        },
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: 120.0,
                ),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      IconsApp.logoKitty,
                      width: 120.0,
                      height: 120.0,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Kitty",
                      style: interTextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w700,
                        color: ColorsApp.grey66,
                      ),
                    ),
                    Text(
                      AppLocale.yourExpenseManager.getString(context),
                      style: interTextStyle(
                        fontWeight: FontWeight.w400,
                        color: ColorsApp.grey66,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    CustomTextfield(
                      controller: loginController,
                      labelText: AppLocale.login.getString(context),
                      errorText: state.errorText,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    CustomTextfield(
                      controller: passwordController,
                      labelText: AppLocale.password.getString(context),
                      errorText: state.errorText,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        CustomFeeledButton(
                          onPressed: _logInAction,
                          name: AppLocale.logIn.getString(context),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        CustomTextButton(
                          onPressed: _signUp,
                          name: AppLocale.signUp.getString(context),
                        ),
                        Spacer(),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    IconButton(
                      onPressed: _authenticationAction,
                      icon: SvgPicture.asset(
                        IconsApp.fingerPrint,
                        width: 64.0,
                        height: 64.0,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
