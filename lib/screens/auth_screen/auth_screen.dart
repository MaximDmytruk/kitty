import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty/screens/home_screen/home_screen.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/icons/icons_app.dart';

import '../../services/local_auth.dart';
import '../../styles/font/fontstyle_app.dart';
import '../../widgets/kitty_feeled_button.dart';
import '../../widgets/kitty_texfield.dart';
import '../../widgets/kitty_text_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  static const String routeName = '/auth_screen';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool auth = false;

  void _logInAction() => Navigator.of(context).pushNamed(HomeScreen.routeName);
  void _signUp() => {};

  void _authenticationAction() async {
    final authenticate = await LocalAuth.authenticate();
    setState(() {
      auth = authenticate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KittyColors.lightGrey250,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 120.0,
          ),
          child: Column(
            children: [
              SvgPicture.asset(
                KittyIcons.logoKitty,
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
                  color: KittyColors.grey66,
                ),
              ),
              Text(
                "Your expense manager",
                style: interTextStyle(
                  fontWeight: FontWeight.w400,
                  color: KittyColors.grey66,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              KittyTextfield(labelText: 'login'),
              SizedBox(
                height: 40,
              ),
              KittyTextfield(labelText: 'password'),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  KittyFeeledButton(onPressed: _logInAction, name: 'Log In'),
                  SizedBox(
                    width: 10.0,
                  ),
                  KittyTextButton(onPressed: _signUp, name: 'Sign up'),
                  Spacer(),
                ],
              ),
              IconButton(
                onPressed: _authenticationAction,
                icon: SvgPicture.asset(
                  KittyIcons.fingerPrint,
                  width: 64.0,
                  height: 64.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
