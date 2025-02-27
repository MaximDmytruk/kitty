import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kitty/utils/localization/app_locale.dart';
import 'package:kitty/models/financial_transaction/financial_transaction.dart';
import 'package:kitty/screens/home_screen/widgets/total_amount_icon.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/icons/icons_app.dart';

class TotalAmount extends StatefulWidget {
  final List<FinancialTransaction> transactions;

  const TotalAmount({
    super.key,
    required this.transactions,
  });

  @override
  State<TotalAmount> createState() => _TotalAmountState();
}

class _TotalAmountState extends State<TotalAmount> {
  int income = 0;
  int balance = 0;
  int expense = 0;

  @override
  void initState() {
    _calculate();
    super.initState();
  }

  void _calculate() {
    for (FinancialTransaction trns in widget.transactions) {
      switch (trns.financialAction) {
        case FinancialAction.income:
          income += trns.amount;
        case FinancialAction.expense:
          expense += trns.amount;
      }
    }
    balance = income - expense;
  
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 16.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          8.0,
        ),
        border: Border.all(
          color: ColorsApp.lightGrey224,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //Expense
          TotalAmountIcon(
            value: expense,
            color: ColorsApp.red,
            name: AppLocale.expenses.getString(context),
            icon: SvgPicture.asset(
              IconsApp.income,
            ),
          ),
          //Balance
          TotalAmountIcon(
            value: balance,
            color: ColorsApp.green,
            name: AppLocale.balance.getString(context),
            icon: SvgPicture.asset(
              IconsApp.income,
            ),
          ),
          //Income
          TotalAmountIcon(
            value: income,
            color: ColorsApp.black,
            name: AppLocale.income.getString(context),
            icon: SvgPicture.asset(
              IconsApp.income,
            ),
          ),
        ],
      ),
    );
  }
}
