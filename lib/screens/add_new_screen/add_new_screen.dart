import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:kitty/localization/app_locale.dart';
import 'package:kitty/model/financial_transaction.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/widgets/custom_dropdown_menu.dart';
import 'package:kitty/widgets/custom_feeled_button.dart';
import 'package:kitty/widgets/custom_status_bar.dart';
import 'package:kitty/widgets/custom_texfield.dart';
import 'package:kitty/widgets/header_app_bar.dart';
// import 'package:kitty/widgets/header_app_bar.dart';

class AddNewScreen extends StatefulWidget {
  const AddNewScreen({super.key});

  static const String routeName = '/add_new_screen';
  @override
  State<AddNewScreen> createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {
  TextEditingController categoryNameController = TextEditingController();
  TextEditingController enterAmountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  FinancialAction selectedValue = FinancialAction.income;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void addFinOperationAction() {}

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
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  children: [
                    SizedBox(
                      height: 16.0,
                    ),
                    CustomDropdownMenu(
                      padding: EdgeInsets.symmetric(horizontal: 0.0),
                      selectedValue: selectedValue,
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
                            selectedValue = value;
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
              name: selectedValue == FinancialAction.expense
                  ? AppLocale.addNewExpense.getString(context)
                  : AppLocale.addNewIncome.getString(context),
            ),
          ),
        ],
      ),
    );
  }
}
