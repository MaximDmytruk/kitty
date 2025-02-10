import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:kitty/data/cubits/fin_category_cubit/fin_category_cubit.dart';
import 'package:kitty/data/cubits/user_cubit/user_cubit.dart';
import 'package:kitty/localization/app_locale.dart';

import 'package:kitty/data/models/financial_category/financial_category.dart';
import 'package:kitty/data/models/financial_transaction/financial_transaction.dart';
import 'package:kitty/screens/add_new_category_screem/screen/add_new_category_screen.dart';

import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/widgets/icons/category_icon.dart';
import 'package:kitty/widgets/dropdown_menus/custom_dropdown_menu.dart';
import 'package:kitty/widgets/buttons/custom_feeled_button.dart';
import 'package:kitty/widgets/app_bars/custom_status_bar.dart';
import 'package:kitty/widgets/text_fields/custom_texfield.dart';
import 'package:kitty/widgets/app_bars/header_app_bar.dart';
import 'package:kitty/widgets/bottom_sheets/show_custom_bottom_sheet.dart';

class AddNewTransactionScreen extends StatefulWidget {
  const AddNewTransactionScreen({super.key});

  static const String routeName = '/add_new_screen';
  @override
  State<AddNewTransactionScreen> createState() =>
      _AddNewTransactionScreenState();
}

class _AddNewTransactionScreenState extends State<AddNewTransactionScreen> {
  TextEditingController categoryNameController = TextEditingController();
  TextEditingController enterAmountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  FinancialAction selectedFinanceAction = FinancialAction.income;
  // List<FinancialCategory> financialCategories = [];
  FinancialCategory? selectedCategory;

  @override
  void initState() {
    super.initState();
  }

  void addFinOperationAction() {
    String categoryName = categoryNameController.text;
    int? amount = int.tryParse(enterAmountController.text);
    String description = descriptionController.text;
    DateTime dateTime = DateTime.now();

    if (categoryName.isNotEmpty &&
        enterAmountController.text.isNotEmpty &&
        amount != null &&
        selectedCategory != null) {
      FinancialTransaction newFinancialTransaction = FinancialTransaction(
        financialAction: selectedFinanceAction,
        category: selectedCategory!,
        amount: amount,
        date: dateTime,
        description: description,
      );

      // context
      //     .read<UserCubit>()
      //     .addFinancialTransaction(newFinancialTransaction);
      // Navigator.pop(context);
    }
  }

  void addNewCategory() {
    Navigator.of(context).pushNamed(AddNewCategory.routeName);
  }

  //BottomSheet
  void categoryNameAction() async {
    showCustomBottomSheet(
        nameHeader: AppLocale.chooseCategory.getString(context),
        context: context,
        length: context.read<FinCategoryCubit>().state.categories?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return BlocBuilder<FinCategoryCubit, FinCategoryState>(
            builder: (context, state) {
              String name = state.categories![index].name;
              Color colorValue = state.categories![index].colorValue;
              String iconPath = state.categories![index].iconPath;
              return InkWell(
                onTap: () {
                  chooseCategory(name, colorValue, iconPath);
                },
                child: CategoryIcon(
                  color: colorValue,
                  iconPath: iconPath,
                  name: name,
                ),
              );
            },
          );
        },
        onPressed: addNewCategory,
        buttonName: AppLocale.addNewCategory.getString(context));
  }

  void chooseCategory(String nameOfNewCategory, Color color, String iconPath) {
    selectedCategory = FinancialCategory(
      name: nameOfNewCategory,
      colorValue: color,
      iconPath: iconPath,
    );
    categoryNameController.text = nameOfNewCategory;
    Navigator.pop(context);
  }

  @override
  void dispose() {
    categoryNameController.dispose();
    enterAmountController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              CustomStatusBar(),
              HeaderAppBar(
                name: AppLocale.addNew.getString(context),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  children: [
                    SizedBox(
                      height: 16.0,
                    ),
                    CustomDropdownMenu(
                      padding: EdgeInsets.symmetric(
                        horizontal: 0.0,
                      ),
                      selectedValue: selectedFinanceAction,
                      dropdownMenuEntries: [
                        DropdownMenuEntry(
                          value: FinancialAction.income,
                          label: AppLocale.income.getString(context),
                        ),
                        DropdownMenuEntry(
                          value: FinancialAction.expense,
                          label: AppLocale.expenses.getString(context),
                        ),
                      ],
                      onSelected: (value) => {
                        setState(
                          () {
                            selectedFinanceAction = value;
                          },
                        ),
                      },
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    CustomTextfield(
                      labelText: AppLocale.categoryName.getString(context),
                      controller: categoryNameController,
                      readOnly: true,
                      onTap: categoryNameAction,
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    CustomTextfield(
                      labelText: AppLocale.enterAmount.getString(context),
                      controller: enterAmountController,
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    CustomTextfield(
                      labelText: AppLocale.description.getString(context),
                      controller: descriptionController,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 32.0,
            ),
            child: CustomFeeledButton(
              onPressed: addFinOperationAction,
              name: selectedFinanceAction == FinancialAction.expense
                  ? AppLocale.addNewExpense.getString(context)
                  : AppLocale.addNewIncome.getString(context),
            ),
          ),
        ],
      ),
    );
  }
}
