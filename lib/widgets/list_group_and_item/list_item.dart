import 'package:flutter/material.dart';
import 'package:kitty/models/financial_transaction/financial_transaction.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';
import 'package:kitty/widgets/icons/category_icon.dart';

class ListItem extends StatelessWidget {
  final FinancialTransaction transaction;

  const ListItem({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8.0,
      children: [
        CategoryIcon(
          color: transaction.category.colorValue,
          iconPath: transaction.category.iconPath,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              transaction.category.name,
              style: interTextStyle(),
            ),
            Text(
              transaction.description ?? '',
              style: interTextStyle(
                fontSize: 12.0,
                color: ColorsApp.grey97,
              ),
            ),
          ],
        ),
        Spacer(),
        Text(
          transaction.financialAction == FinancialAction.income
              ? transaction.amount.toString()
              : ' - ${transaction.amount.toString()}',
          style: interTextStyle(
            color: transaction.financialAction == FinancialAction.income
                ? ColorsApp.green
                : ColorsApp.red,
          ),
        )
      ],
    );
  }
}
