import 'package:flutter/material.dart';
import 'package:kitty/database/database.dart';
import 'package:kitty/models/financial_category/financial_category.dart';
import 'package:kitty/models/financial_transaction/financial_transaction.dart';
import 'package:sqflite/sqflite.dart';

class FinTransactionRepository {
  final AppDatabase database = AppDatabase.instance;

  Future<void> insertTransaction(FinancialTransaction transaction) async {
    Database db = await database.database;

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
    DateTime? date,
  }) async {




    Database db = await database.database;
    final List<Map<String, dynamic>> result = await db.rawQuery('''
      SELECT t.*, c.id as categoryId, c.name, c.colorValue, c.iconPath, c.position 
      FROM transactions t 
      JOIN categories c ON t.categoryId = c.id
      
    ''');
    // WHERE DATE(datetime) = '2009-10-20
  // where -  умова по даті у таблиці пошуку,


    return result.map((row) {
      final category = FinancialCategory(
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



  // Future<int> addTransaction(FinancialTransaction transaction) async {
  //   final Database db = await database.database;
  //   return await db.insert(
  //     'transactions',
  //     {
  //       'financialAction': transaction.financialAction.name,
  //       'category_id': transaction.category.id,
  //       'amount': transaction.amount,
  //       'description': transaction.description,
  //       'date': transaction.date.toIso8601String(),
  //     },
  //   );
  // }

  // // Future<int> addTransaction(FinancialTransaction transaction) async {
  // //   final Database db = await database.database;
  // //   return await db.insert(
  // //     'transactions',
  // //     transaction.toJson(),
  // //   );
  // // }

  // //TODO: доробити, витягнути з таблиці.
  // Future<List<FinancialTransaction>> getAllTransaction() async {
  //   Database db = await database.database;
  //   List<Map<String, Object?>> result = await db.query('transactions');

  //   for (var res in result) {
  //     print(res.keys);
  //     print(res.entries);
  //   }

  //   return result
  //       .map((transaction) => FinancialTransaction.fromJson(transaction))
  //       .toList();
  // }

  // Future<List<FinancialTransaction>> getTransactions() async {
  //   Database db = await database.database;

  //   final result = await db.query(
  //     'transactions',
  //     orderBy: 'date DESC',
  //   );

  //   return result.map((json) {
  //     return FinancialTransaction.fromJson(json);
  //   }).toList();
  // }

