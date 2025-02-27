import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:kitty/blocs/fin_category_cubit/fin_category_cubit.dart';

import 'package:kitty/utils/localization/app_locale.dart';
import 'package:kitty/models/financial_category/financial_category.dart';
import 'package:kitty/screens/add_new_category_screen/screen/add_new_category_screen.dart';
import 'package:kitty/screens/manage_categories_screen/widgets/category_icon_row.dart';
import 'package:kitty/styles/colors/colors_app.dart';

import 'package:kitty/widgets/buttons/custom_feeled_button.dart';
import 'package:kitty/widgets/app_bars/custom_status_bar.dart';
import 'package:kitty/widgets/app_bars/header_app_bar.dart';

class ManageCategoriesScreen extends StatefulWidget {
  const ManageCategoriesScreen({super.key});

  static const String routeName = '/manage_categories_screen';
  @override
  State<ManageCategoriesScreen> createState() => _ManageCategoriesScreenState();
}

class _ManageCategoriesScreenState extends State<ManageCategoriesScreen> {
  void editAction(
    FinancialCategory category,
    List<FinancialCategory> listCategories,
  ) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddNewCategory(
          initialCategory: category,
        ),
      ),
    );
  }

  void addNewCategoryAction() =>
      Navigator.of(context).pushNamed(AddNewCategory.routeName);

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
                name: AppLocale.manageCategories.getString(context),
              ),
              Expanded(
                child: BlocBuilder<FinCategoryCubit, FinCategoryState>(
                  builder: (context, state) {
                    List<FinancialCategory> financialCategories =
                        state.categories ?? [];

                    return ReorderableListView(
                      padding: EdgeInsets.only(
                        left: 16.0,
                        right: 16.0,
                        top: 24.0,
                        bottom: 88.0,
                      ),
                      children:
                          List.generate(financialCategories.length, (index) {
                        FinancialCategory category = financialCategories[index];

                        Color color = category.colorValue;
                        String name = category.name;
                        String icon = category.iconPath;

                        return CategoryIconRow(
                          key: UniqueKey(),
                          editOnPressed: () {
                            editAction(category, financialCategories);
                          },
                          name: name,
                          iconPath: icon,
                          iconColor: color,
                        );
                      }),
                      onReorder: (oldIndex, newIndex) {
                        context
                            .read<FinCategoryCubit>()
                            .changePosition(oldIndex, newIndex);
                      },
                    );
                  },
                ),
              ),
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
