  import 'package:kitty/models/financial_transaction/financial_transaction.dart';
  
  List<List<FinancialTransaction>> filteredTransactionsByDay(
    List<FinancialTransaction> transactions,
  ) {
    Map<int, List<FinancialTransaction>> grouped = {};

    for (FinancialTransaction transaction in transactions) {
      int dateKey = transaction.date.day;
      if (!grouped.containsKey(dateKey)) {
        grouped[dateKey] = [];
      }
      grouped[dateKey]!.add(transaction);
    }

    List<int> sortedKeys = grouped.keys.toList();
    sortedKeys.sort();

    return sortedKeys.map((key) => grouped[key]!).toList();
  }