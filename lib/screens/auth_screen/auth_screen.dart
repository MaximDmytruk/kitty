import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/icons/icons_app.dart';
import 'package:kitty/styles/images/images_app.dart';

import '../../styles/font/fontstyle_app.dart';
import '../../widgets/feeled_button.dart';
import '../../widgets/kitty_texfield.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  static const String routeName = '/auth_screen';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  void buttonAction() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: KittyColors.lightGrey224,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
          child: Column(
            children: [
              SvgPicture.asset(KittyIcons.logoKitty),
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
              KittyTextfield(labelText: 'Enter login'),
              SizedBox(
                height: 40,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: KittyColors.grey97,
                    ),
                  ),
                  labelText: 'Enter login',
                ),
              )
            ],
          ),
        ));
  }
}
