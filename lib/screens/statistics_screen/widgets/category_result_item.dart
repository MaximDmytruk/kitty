import 'package:flutter/material.dart';
import 'package:kitty/models/financial_category/financial_category.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';
import 'package:kitty/widgets/icons/category_icon.dart';

class CategoryResultItem extends StatelessWidget {
  final FinancialCategory category;
  final int totalAmount;
  final double percentage;

  const CategoryResultItem(
      {super.key,
      required this.category,
      required this.totalAmount,
      required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8.0,
      children: [
        CategoryIcon(
          color: category.colorValue,
          iconPath: category.iconPath,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category.name,
              style: interTextStyle(),
            ),
            Text(
              category.name,
              style: interTextStyle(
                fontSize: 12.0,
                color: ColorsApp.grey97,
              ),
            ),
          ],
        ),
        Spacer(),
        Column(
          children: [
            Text(
              totalAmount.toString(),
              style: interTextStyle(
                color: ColorsApp.red,
              ),
            ),
             Text(
              '${percentage.toStringAsFixed(0)}%',
              style: interTextStyle(
                fontSize: 12.0,
                color: ColorsApp.black,
              ),
            ),
          ],
        )
      ],
    );
  }
}
