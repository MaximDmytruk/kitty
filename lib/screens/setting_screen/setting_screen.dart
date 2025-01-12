import 'package:flutter/material.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';
import 'package:kitty/widgets/kitty_status_bar.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StatusBar(),
        AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Setting',
            style: interTextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              color: KittyColors.grey66,
            ),
          ),
        )
      ],
    );
  }
}
