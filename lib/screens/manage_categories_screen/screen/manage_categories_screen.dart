import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';

import 'package:kitty/data/cubits/user_cubit/user_cubit.dart';
import 'package:kitty/localization/app_locale.dart';
import 'package:kitty/models/financial_category.dart';
import 'package:kitty/screens/add_new_category_screem/screen/add_new_category_screen.dart';
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
    Object? updatedCategory = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddNewCategory(initialCategory: category),
      ),
    );

    if (updatedCategory != null && updatedCategory is FinancialCategory) {
      setState(
        () {
          int index = listCategories.indexOf(category);
          if (index != -1) {
            listCategories[index] = updatedCategory;
          }
        },
      );
    }
  }

  void addNewCategoryAction() => Navigator.of(context)
          .pushNamed(AddNewCategory.routeName)
          .whenComplete(() {
        // setState(() {});
      });

  @override
  void initState() {
    super.initState();
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
                name: AppLocale.manageCategories.getString(context),
              ),
              Expanded(
                child: BlocBuilder<UserCubit, UserState>(
                  builder: (context, state) {
                    List<FinancialCategory> financialCategories =
                        state.user!.categoryService.getCategories();

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

                        Color color = category.color;
                        String name = category.name;
                        Widget icon = category.icon;

                        return CategoryIconRow(
                          key: UniqueKey(),
                          editOnPressed: () {
                            editAction(category, financialCategories);
                          },
                          name: name,
                          icon: icon,
                          iconColor: color,
                        );
                      }),
                      onReorder: (int oldIndex, int newIndex) {
                        setState(
                          () {
                            if (oldIndex < newIndex) {
                              newIndex -= 1;
                            }
                            final FinancialCategory item =
                                financialCategories.removeAt(oldIndex);
                            financialCategories.insert(newIndex, item);
                          },
                        );
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
