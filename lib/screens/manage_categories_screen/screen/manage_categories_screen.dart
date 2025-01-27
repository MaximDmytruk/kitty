import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty/cubit/user_cubit.dart';
import 'package:kitty/localization/app_locale.dart';
import 'package:kitty/model/financial_category.dart';
import 'package:kitty/screens/manage_categories_screen/widgets/category_icon_row.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';
import 'package:kitty/styles/icons/category_icons.dart';
import 'package:kitty/styles/icons/icons_app.dart';
import 'package:kitty/widgets/custom_status_bar.dart';
import 'package:kitty/widgets/custom_text_button.dart';
import 'package:kitty/widgets/header_app_bar.dart';

class ManageCategoriesScreen extends StatefulWidget {
  const ManageCategoriesScreen({super.key});

  static const String routeName = '/manage_categories_screen';
  @override
  State<ManageCategoriesScreen> createState() => _ManageCategoriesScreenState();
}

class _ManageCategoriesScreenState extends State<ManageCategoriesScreen> {
  void editAction() {}
  void changePositionAction() {}
  List<FinancialCategory> financialCategories = [];

  @override
  void initState() {
    super.initState();
    financialCategories = context.read<UserCubit>().getFinancialCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.lightGrey250,
      body: Column(
        children: [
          CustomStatusBar(),
          HeaderAppBar(
            name: AppLocale.manageCategories.getString(context),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
              itemCount: financialCategories.length,
              itemBuilder: (context, index) {
                Color color = financialCategories[index].color;
                String name = financialCategories[index].name;
                Widget icon = financialCategories[index].icon;

                return CategoryIconRow(
                    editOnPressed: editAction,
                    name: name,
                    icon: icon,
                    iconColor: color,
                    changePositionOnPressed: changePositionAction);
              },
            ),
          ),
        ],
      ),
    );
  }
}
