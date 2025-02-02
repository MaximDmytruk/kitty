import 'package:kitty/model/financial_category.dart';

enum FinancialAction {
  income,
  expense,
}

class FinancialTransaction {
  final FinancialAction financialAction;
  final FinancialCategory category;
  final int amount;
  final String? description;
  final DateTime date;

  FinancialTransaction({
    required this.financialAction,
    required this.category,
    required this.amount,
    this.description,
    required this.date,
  });
}
