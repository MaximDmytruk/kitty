import 'package:kitty/utils/default_categories.dart';
import 'package:kitty/database/database.dart';
import 'package:kitty/models/financial_category/financial_category.dart';
import 'package:sqflite/sqflite.dart';

class FinCategoryRepository {
  final AppDatabase database = AppDatabase.instance;

  Future<void> initDefaultCategories() async {
    Database db = await database.database;
    Batch batch = db.batch();

    final List<FinancialCategory> defaultCategories = getDefaultCategories();
    for (FinancialCategory  category in defaultCategories) {
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

  Future<FinancialCategory> addNewCategory(FinancialCategory category) async {
    Database db = await database.database;
    final maxPosition = await _getMaxPosition();
    final newCategory = category.copyWith(position: maxPosition + 1);

    int categoryId = await db.insert(
      'categories',
      newCategory.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return newCategory.copyWith(id: categoryId);
  }

  Future<int> _getMaxPosition() async {
    final Database db = await database.database;
    final result = await db.rawQuery(
      'SELECT MAX(position) as maxPos FROM categories',
    );
    return (result.first['maxPos'] as int?) ?? -1;
  }

  Future<void> updateCategory(FinancialCategory category) async {
    final Database db = await database.database;
    await db.update(
      'categories',
      category.toJson(),
      where: 'id = ?',
      whereArgs: [category.id],
    );
  }

  Future<void> updatePositions(
    List<FinancialCategory> categories,
  ) async {
    final Database db = await database.database;
    final Batch batch = db.batch();
    for (FinancialCategory category in categories) {
      batch.update(
        'categories',
        category.toJson(),
        where: 'id = ?',
        whereArgs: [category.id],
      );
    }
    await batch.commit();
  }

  
}
