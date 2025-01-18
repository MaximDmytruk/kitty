import 'package:flutter/material.dart';
import 'package:kitty/screens/home_screen/widgets/total_amount.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/widgets/custom_status_bar.dart';
import 'package:kitty/widgets/list_group.dart';
import '../../../widgets/custom_date_picker_app_bar.dart';
import '../../../widgets/custom_home_app_bar.dart';

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
          CustomStatusBar(),
          CustomHomeAppBar(
            searchAction: searchAction,
            userAction: userAction,
          ),
          CustomDatePickerAppBar(),
          Padding(
            padding: const EdgeInsets.only(
              top: 16.0,
              left: 16.0,
              right: 16.0,
            ),
            child: TotalAmount(),
          ),
          Expanded(
            child: ListView(
              
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              children: [
                ListGroup(),
                ListGroup(),
                ListGroup(),
                ListGroup(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
