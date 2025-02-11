import 'package:kitty/data/database/database.dart';
import 'package:kitty/data/models/financial_transaction/financial_transaction.dart';
import 'package:sqflite/sqflite.dart';

class FinTransactionRepository {
  final AppDatabase database = AppDatabase.instance;

  Future<int> addTransaction(FinancialTransaction transaction) async {
    final db = await database.database;
    return await db.insert(
      'transactions',
      {
        'financialAction': transaction.financialAction.name,
        'category_id': transaction.category.id,
        'amount': transaction.amount,
        'description': transaction.description,
        'date': transaction.date.toIso8601String(),
      },
    );
  }

  //TODO: доробити, витягнути з таблиці.
  Future<List<FinancialTransaction>> getAllTransaction() async {
    Database db = await database.database;
    List<Map<String, Object?>> result = await db.query('transactions');
    return result
        .map((transaction) => FinancialTransaction.fromJson(transaction))
        .toList();
  }
}

