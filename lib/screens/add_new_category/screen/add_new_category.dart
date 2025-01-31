import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty/data/basic_icons.dart';
import 'package:kitty/model/icon.dart';
import 'package:kitty/services/localization/app_locale.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/icons/icons_app.dart';
import 'package:kitty/widgets/buttons/custom_feeled_button.dart';
import 'package:kitty/widgets/category_icon.dart';
import 'package:kitty/widgets/custom_status_bar.dart';
import 'package:kitty/widgets/custom_texfield.dart';
import 'package:kitty/widgets/header_app_bar.dart';
import 'package:kitty/widgets/show_custom_bottom_sheet.dart';

class AddNewCategory extends StatefulWidget {
  const AddNewCategory({super.key});

  static const String routeName = '/add_new_category_screen';

  @override
  State<AddNewCategory> createState() => _AddNewCategoryState();
}

class _AddNewCategoryState extends State<AddNewCategory> {
  TextEditingController categoryNameController = TextEditingController();
  List<IconModel> icons = BasicIcons().getIcons();

  void addIconAction() {
    int length = icons.length;

    showCustomBottomSheet(
      nameHeader: AppLocale.chooseCategoryIcon.getString(context).toUpperCase(),
      context: context,
      length: length,
      itemBuilder: (context, index) {
        Color color = icons[index].color;
        Widget icon = icons[index].icon;

        return CategoryIcon(color: color, icon: icon);
      },
    );
  }

  void addNewCategoryAction() {}

  @override
  void dispose() {
    categoryNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.lightGrey250,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
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
                      InkWell(
                        onTap: addIconAction,
                        child: SvgPicture.asset(
                          IconsApp.addPlusDashedLine,
                          height: 48.0,
                          width: 48.0,
                          fit: BoxFit.none,
                        ),
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
          Padding(
            padding: EdgeInsets.only(
              bottom: 24.0,
            ),
            child: CustomFeeledButton(
              onPressed: addNewCategoryAction,
              name: AppLocale.addNewCategory.getString(context),
            ),
          ),
        ],
      ),
    );
  }
}
