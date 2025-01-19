import 'package:flutter/material.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/widgets/custom_dropdown_menu.dart';
import 'package:kitty/widgets/custom_status_bar.dart';
import 'package:kitty/widgets/header_app_bar.dart';

class AddNewScreen extends StatefulWidget {
  const AddNewScreen({super.key});

  static const String routeName = '/add_new_screen';
  @override
  State<AddNewScreen> createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {
  String selectedValue = 'Income';
  final List<String> options = [
    'Income',
    'Expense',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KittyColors.white,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          CustomStatusBar(),
          HeaderAppBar(
            name: 'Add new',
          ),
          CustomDropdownMenu(
            selectedValue: selectedValue,
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
             
            ),
          ),
        ],
      ),
    );
  }
}
