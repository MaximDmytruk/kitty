import 'package:kitty/models/financial_category/financial_category.dart';
import 'package:kitty/models/financial_transaction/financial_transaction.dart';

import 'package:kitty/localization/app_locale.dart';
import 'package:kitty/utils/default_categories.dart';

List<FinancialCategory> categories = getDefaultCategories();

Future<List<FinancialTransaction>> getTestingTransaction() async => [
      FinancialTransaction(
        financialAction: FinancialAction.expense,
        category: categories
            .firstWhere((category) => category.name == AppLocale.grocery),
        amount: 50,
        date: DateTime(2025, 5, 12),
      ),
      FinancialTransaction(
        financialAction: FinancialAction.income,
        category: categories
            .firstWhere((category) => category.name == AppLocale.salary),
        amount: 2000,
        date: DateTime(2025, 5, 25),
      ),
      FinancialTransaction(
        financialAction: FinancialAction.expense,
        category: categories
            .firstWhere((category) => category.name == AppLocale.restaurant),
        amount: 120,
        date: DateTime(2025, 6, 3),
      ),
      FinancialTransaction(
        financialAction: FinancialAction.expense,
        category: categories
            .firstWhere((category) => category.name == AppLocale.commute),
        amount: 30,
        date: DateTime(2025, 6, 5),
      ),
      FinancialTransaction(
        financialAction: FinancialAction.income,
        category: categories
            .firstWhere((category) => category.name == AppLocale.interest),
        amount: 150,
        date: DateTime(2025, 6, 10),
      ),
      FinancialTransaction(
        financialAction: FinancialAction.expense,
        category: categories
            .firstWhere((category) => category.name == AppLocale.gifts),
        amount: 75,
        date: DateTime(2025, 7, 1),
      ),
      FinancialTransaction(
        financialAction: FinancialAction.expense,
        category: categories
            .firstWhere((category) => category.name == AppLocale.health),
        amount: 200,
        date: DateTime(2025, 7, 15),
      ),
      FinancialTransaction(
        financialAction: FinancialAction.expense,
        category: categories
            .firstWhere((category) => category.name == AppLocale.barAndCafe),
        amount: 90,
        date: DateTime(2025, 8, 5),
      ),
      FinancialTransaction(
        financialAction: FinancialAction.income,
        category: categories
            .firstWhere((category) => category.name == AppLocale.wages),
        amount: 800,
        date: DateTime(2025, 8, 20),
      ),
      FinancialTransaction(
        financialAction: FinancialAction.expense,
        category: categories
            .firstWhere((category) => category.name == AppLocale.electronics),
        amount: 500,
        date: DateTime(2025, 9, 10),
      ),
      for (int i = 1; i <= 90; i++)
        FinancialTransaction(
          financialAction:
              i % 2 == 0 ? FinancialAction.income : FinancialAction.expense,
          category: categories[i % categories.length],
          amount: (i * 15) % 500 + 20,
          date: DateTime(2025, (i % 12) + 1, (i % 28) + 1),
        ),
    ];
