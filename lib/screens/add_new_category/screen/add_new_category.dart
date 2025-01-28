import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty/localization/app_locale.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/icons/icons_app.dart';
import 'package:kitty/widgets/custom_status_bar.dart';
import 'package:kitty/widgets/custom_texfield.dart';
import 'package:kitty/widgets/header_app_bar.dart';

class AddNewCategory extends StatefulWidget {
  const AddNewCategory({super.key});

  static const String routeName = '/add_new_category_screen';

  @override
  State<AddNewCategory> createState() => _AddNewCategoryState();
}

class _AddNewCategoryState extends State<AddNewCategory> {
  TextEditingController categoryNameController = TextEditingController();

  @override
  void dispose() {
    categoryNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.lightGrey250,
      body: Column(
        children: [
          CustomStatusBar(),
          HeaderAppBar(
            name: AppLocale.addNewCategory.getString(context),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 28.0,
            ),
            child: SizedBox(
              width: double.infinity,
              child: Row(
                spacing: 16.0,
                children: [
                  SvgPicture.asset(
                    IconsApp.addPlusDashedLine,
                    height: 48.0,
                    width: 48.0,
                    fit: BoxFit.none,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 48.0,
                      child: CustomTextfield(
                          labelText: AppLocale.categoryName,
                          controller: categoryNameController),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
