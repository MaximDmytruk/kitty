class FinancialTransaction {
  final String name;
  final String category;
  final int amount;
  final DateTime date;

  FinancialTransaction({
    required this.date,
    required this.name,
    required this.category,
    required this.amount,
  });
}
