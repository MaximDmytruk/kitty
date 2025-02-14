import 'package:flutter/material.dart';
import 'package:kitty/database/database.dart';
import 'package:kitty/models/financial_category/financial_category.dart';
import 'package:kitty/models/financial_transaction/financial_transaction.dart';
import 'package:sqflite/sqflite.dart';

class FinTransactionRepository {
  final AppDatabase database = AppDatabase.instance;

  Future<void> insertTransaction(FinancialTransaction transaction) async {
    Database db = await database.database;
    print(
        'Transaction have date - ${transaction.date.toIso8601String()}--------------------------------');
    await db.insert(
      'transactions',
      {
        'financialAction': transaction.financialAction.toString(),
        'categoryId': transaction.category.id,
        'amount': transaction.amount,
        'description': transaction.description,
        'date': transaction.date.toIso8601String(),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print('SAVED IN SQL TRANSACTION');
    print(transaction);
    print('');
  }

  Future<List<FinancialTransaction>> getAllTransactions({
    int? dateMonth,
  }) async {
    Database db = await database.database;
    final List<Map<String, dynamic>> result;

    if (dateMonth == null) {
      result = await db.rawQuery('''
      SELECT t.*, c.id as categoryId, c.name, c.colorValue, c.iconPath, c.position 
      FROM transactions t 
      JOIN categories c ON t.categoryId = c.id
    ''');
    } else {
      String month = '';
      if (dateMonth < 10) {
        month = '0${dateMonth}';
      }

      result = await db.rawQuery('''
      SELECT t.*, c.id as categoryId, c.name, c.colorValue, c.iconPath, c.position 
      FROM transactions t 
      JOIN categories c ON t.categoryId = c.id
      WHERE strftime('%m', date) = '$month'
    ''');
    }

    return result.map((row) {
      final FinancialCategory category = FinancialCategory(
        id: row['categoryId'] as int,
        name: row['name'] as String,
        colorValue: Color(row['colorValue'] as int),
        iconPath: row['iconPath'] as String,
        position: row['position'] as int?,
      );

      return FinancialTransaction(
        id: row['id'] as int?,
        financialAction: FinancialAction.values
            .firstWhere((e) => e.toString() == row['financialAction']),
        category: category,
        amount: row['amount'] as int,
        description: row['description'] as String?,
        date: DateTime.parse(row['date'] as String),
      );
    }).toList();
  }
}
