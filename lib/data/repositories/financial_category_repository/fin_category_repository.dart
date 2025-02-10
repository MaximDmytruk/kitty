import 'package:kitty/constants/default_categories.dart';
import 'package:kitty/data/database/database.dart';
import 'package:kitty/data/models/financial_category/financial_category.dart';
import 'package:sqflite/sqflite.dart';

class FinCategoryRepository {
  final AppDatabase database = AppDatabase.instance;

  // Future<List<FinancialCategory>> getFinancialCategories() async {
  //   final db = await dbHelper.database;
  //   final List<Map<String, Object?>> result = await db.query('categories');
  //   return result.map((e) => FinancialCategory.fromJson(e)).toList();
  // }

  Future<void> initDefaultCategories() async {
    Database db = await database.database;
    Batch batch = db.batch();
    final List<FinancialCategory> defaultCategories = getDefaultCategories();
    for (var category in defaultCategories) {
      batch.insert('categories', category.toJson());
    }
    await batch.commit();
  }

  Future<List<FinancialCategory>> getAllCategories() async {
    Database db = await database.database;
    List<Map<String, Object?>> result = await db.query('categories');
    return result
        .map((category) => FinancialCategory.fromJson(category))
        .toList();
  }

  Future<void> insertCategory(FinancialCategory category) async {
    Database db = await database.database;
    final maxPosition = await _getMaxPosition();
    final newCategory = category.copyWith(position: maxPosition + 1);

    await db.insert(
      'categories',
      newCategory.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> _getMaxPosition() async {
    final Database db = await database.database;
    final result =
        await db.rawQuery('SELECT MAX(position) as maxPos FROM categories');
    return (result.first['maxPos'] as int?) ?? -1;
  }

  // Future<void> addNewListCategories(
  //     List<FinancialCategory> listFinCategories) async {
  //   for (FinancialCategory category in listFinCategories) {
  //     await addNewCategory(category);
  //   }
  // }

  // Future<void> addNewCategory(FinancialCategory category) async {
  //   final db = await dbHelper.database;
  //   await db.insert('categories', category.toJson());
  // }

  // Future<void> addNewCategory(FinancialCategory category) async {
  //   final Database db = await database.database;
  //   await db.insert('categories', category.toJson());
  // }

  Future<void> addNewCategory(FinancialCategory category) async {
    final Database db = await database.database;
    final maxPosition = await _getMaxPosition();
    final newCategory = category.copyWith(position: maxPosition + 1);

    await db.insert(
      'categories',
      newCategory.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }



  // Future<void> removeAllCategories() async {
  //   final db = await dbHelper.database;
  //   await db.delete('categories');
  // }
  Future<void> updateCategory(FinancialCategory category) async {
    final Database db = await database.database;
    await db.update('categories', category.toJson(),
        where: 'id = ?', whereArgs: [category.id]);
  }

  Future<void> updatePositions(List<FinancialCategory> categories) async {
    final Database db = await database.database;
    final Batch batch = db.batch();
    for (FinancialCategory category in categories) {
      batch.update('categories', category.toJson(),
          where: 'id = ?', whereArgs: [category.id]);
    }
    await batch.commit();
  }

  // Future<void> updateCategory(FinancialCategory category) async {
  //   if (category.position == null) {
  //     print('Position is null');
  //     return;
  //   }
  //   final db = await dbHelper.database;
  //   await db.update(
  //     'categories',
  //     category.toJson(),
  //     // where: 'name = ?',
  //     // whereArgs: [category.name],
  //     where: 'position = ?',
  //     whereArgs: [category.position],
  //   );
  // }
}
