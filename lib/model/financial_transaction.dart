enum FinancialAction {
  income,
  expense,
}

class FinancialTransaction {
  final FinancialAction financialAction;
  final String categoryName;
  final int amount;
  final String? description;
  final DateTime date;

  FinancialTransaction({
    required this.financialAction,
    required this.categoryName,
    required this.amount,
    this.description,
    required this.date,
  });
}
