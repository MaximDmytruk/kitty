import 'package:flutter/material.dart';

import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/widgets/kitty_status_bar.dart';
import '../../widgets/kitty_date_picker_app_bar.dart';
import '../../widgets/kitty_home_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  // static const String routeName = '/home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void searchAction() {}
  void userAction() {}
  void leftDateAction() {}
  void rightDateAction() {}
  void datePickerAction() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KittyColors.white,
      body: Column(
        children: [
          StatusBar(),
          KittyHomeAppBar(
            searchAction: searchAction,
            userAction: userAction,
          ),
          KittyDatePickerAppBar(),
        ],
      ),
    );
  }
}
