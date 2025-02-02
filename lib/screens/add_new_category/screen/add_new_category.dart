import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:kitty/cubit/user_cubit/user_cubit.dart';
import 'package:kitty/data/basic_icons.dart';
import 'package:kitty/model/financial_category.dart';
import 'package:kitty/model/icon.dart';
import 'package:kitty/screens/bottom_navigation_screen/bottom_navigation_screen.dart';
import 'package:kitty/localization/app_locale.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/icons/icons_app.dart';
import 'package:kitty/widgets/buttons/custom_feeled_button.dart';
import 'package:kitty/widgets/category_icon.dart';
import 'package:kitty/widgets/app_bars/custom_status_bar.dart';
import 'package:kitty/widgets/text_fields/custom_texfield.dart';
import 'package:kitty/widgets/app_bars/header_app_bar.dart';
import 'package:kitty/widgets/bottom_sheets/show_custom_bottom_sheet.dart';

class AddNewCategory extends StatefulWidget {
  final FinancialCategory? initialCategory;

  const AddNewCategory({
    super.key,
    this.initialCategory,
  });

  static const String routeName = '/add_new_category_screen';

  @override
  State<AddNewCategory> createState() => _AddNewCategoryState();
}

class _AddNewCategoryState extends State<AddNewCategory> {
  late TextEditingController categoryNameController;
  List<IconModel> icons = BasicIcons().getIcons();
  CategoryIcon? selectedIcon;

  @override
  void initState() {
    super.initState();

    categoryNameController = TextEditingController(
      text: widget.initialCategory?.name ?? '',
    );

    if (widget.initialCategory != null) {
      selectedIcon = CategoryIcon(
        color: widget.initialCategory!.color,
        icon: widget.initialCategory!.icon,
      );
    }
  }

  void iconCategoryOnTap(Widget icon, Color color) {
    setState(() {
      selectedIcon = CategoryIcon(color: color, icon: icon);
    });
  }

  void addIconAction() {
    int length = icons.length;

    showCustomBottomSheet(
      nameHeader: AppLocale.chooseCategoryIcon.getString(context).toUpperCase(),
      context: context,
      length: length,
      itemBuilder: (context, index) {
        Color color = icons[index].color;
        Widget icon = icons[index].icon;

        return InkWell(
          onTap: () {
            iconCategoryOnTap(icon, color);
            Navigator.pop(context);
          },
          child: CategoryIcon(
            color: color,
            icon: icon,
          ),
        );
      },
    );
  }

  void addNewCategoryAction() async {
    if (selectedIcon != null && categoryNameController.text.isNotEmpty) {
      FinancialCategory newCategory = FinancialCategory(
        categoryNameController.text,
        selectedIcon!.color,
        selectedIcon!.icon,
      );

      if (widget.initialCategory != null) {
        Navigator.pop(context, newCategory);
      } else {
        context.read<UserCubit>().addNewCategory(newCategory);

        await Navigator.popAndPushNamed(
          context,
          BottomNavigationScreen.routeName,
        );
      }
    }
  }

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
                    children: [
                      InkWell(
                        onTap: addIconAction,
                        child: selectedIcon ??
                            SvgPicture.asset(IconsApp.addPlusDashedLine),
                      ),
                      const SizedBox(width: 16.0),
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
            padding: const EdgeInsets.only(
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
