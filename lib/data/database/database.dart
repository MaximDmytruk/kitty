import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBase {
  static final DataBase instance = DataBase._initDatabase();
  static Database? _database;

  DataBase._initDatabase();

   Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'users_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE users (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      surname TEXT NOT NULL,
      mail TEXT NOT NULL,
      password TEXT NOT NULL
    )
    ''');

  }

}
