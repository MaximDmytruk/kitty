import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kitty/model/financial_category.dart';
import 'package:kitty/model/financial_transaction.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/icons/category_icons.dart';

List<FinancialTransaction> testingTransaction = [
  FinancialTransaction(
    financialAction: FinancialAction.expense,
    category: FinancialCategory(
      "Grocery",
      ColorsApp.lightGreen200,
      SvgPicture.asset(CategoryIcons.groceries, fit: BoxFit.none),
    ),
    amount: 50,
    date: DateTime(2023, 5, 12),
  ),
  FinancialTransaction(
    financialAction: FinancialAction.income,
    category: FinancialCategory(
      "Salary",
      ColorsApp.peach255,
      SvgPicture.asset(CategoryIcons.money, fit: BoxFit.none),
    ),
    amount: 2000,
    date: DateTime(2023, 5, 25),
  ),
  FinancialTransaction(
    financialAction: FinancialAction.expense,
    category: FinancialCategory(
      "Restaurant",
      ColorsApp.lightSlateBlue197,
      SvgPicture.asset(CategoryIcons.restaurant, fit: BoxFit.none),
    ),
    amount: 120,
    date: DateTime(2023, 6, 3),
  ),
  FinancialTransaction(
    financialAction: FinancialAction.expense,
    category: FinancialCategory(
      "Commute",
      ColorsApp.lightBlue178,
      SvgPicture.asset(CategoryIcons.transportation, fit: BoxFit.none),
    ),
    amount: 30,
    date: DateTime(2023, 6, 5),
  ),
  FinancialTransaction(
    financialAction: FinancialAction.income,
    category: FinancialCategory(
      "Interest",
      ColorsApp.orange255,
      SvgPicture.asset(CategoryIcons.interest, fit: BoxFit.none),
    ),
    amount: 150,
    date: DateTime(2023, 6, 10),
  ),
  FinancialTransaction(
    financialAction: FinancialAction.expense,
    category: FinancialCategory(
      "Gifts",
      ColorsApp.pink225,
      SvgPicture.asset(CategoryIcons.gifts, fit: BoxFit.none),
    ),
    amount: 75,
    date: DateTime(2023, 7, 1),
  ),
  FinancialTransaction(
    financialAction: FinancialAction.expense,
    category: FinancialCategory(
      "Health",
      ColorsApp.pink248,
      SvgPicture.asset(CategoryIcons.health, fit: BoxFit.none),
    ),
    amount: 200,
    date: DateTime(2023, 7, 15),
  ),
  FinancialTransaction(
    financialAction: FinancialAction.expense,
    category: FinancialCategory(
      "Bar & Cafe",
      ColorsApp.yellow255,
      SvgPicture.asset(CategoryIcons.bar, fit: BoxFit.none),
    ),
    amount: 90,
    date: DateTime(2023, 8, 5),
  ),
  FinancialTransaction(
    financialAction: FinancialAction.income,
    category: FinancialCategory(
      "Wages",
      ColorsApp.yellow255249,
      SvgPicture.asset(CategoryIcons.donate, fit: BoxFit.none),
    ),
    amount: 800,
    date: DateTime(2023, 8, 20),
  ),
  FinancialTransaction(
    financialAction: FinancialAction.expense,
    category: FinancialCategory(
      "Electronics",
      ColorsApp.pink255,
      SvgPicture.asset(CategoryIcons.electronics, fit: BoxFit.none),
    ),
    amount: 500,
    date: DateTime(2023, 9, 10),
  ),
  for (int i = 1; i <= 90; i++)
    FinancialTransaction(
      financialAction:
          i % 2 == 0 ? FinancialAction.income : FinancialAction.expense,
      category: FinancialCategory(
        i % 5 == 0
            ? "Savings"
            : i % 4 == 0
                ? "Allowance"
                : i % 3 == 0
                    ? "Commute"
                    : i % 2 == 0
                        ? "Grocery"
                        : "Health",
        Colors.primaries[i % Colors.primaries.length],
        SvgPicture.asset(CategoryIcons.money, fit: BoxFit.none),
      ),
      amount: (i * 15) % 500 + 20,
      date: DateTime(2020 + (i % 6), (i % 12) + 1, (i % 28) + 1),
    ),
];
