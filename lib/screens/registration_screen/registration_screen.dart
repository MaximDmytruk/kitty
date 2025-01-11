import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.grey, // Сірий колір статус-бару
        statusBarIconBrightness: Brightness.dark, // Світлі значки у статус-барі
      ),
    );
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
                      'Create account',
                      style: interTextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.w500,
                        color: KittyColors.grey66,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'please enter your details',
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
                  KittyTextfield(labelText: 'name'),
                  KittyTextfield(labelText: 'enter your email'),
                  KittyTextfield(
                    labelText: 'password',
                    addObscureText: true,
                  ),
                  KittyTextfield(
                    labelText: 'repeat password',
                    addObscureText: true,
                  ),
                  Center(
                    child: KittyFeeledButton(
                        onPressed: createAccountAction, name: 'Create account'),
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
