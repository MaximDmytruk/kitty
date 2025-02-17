import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  static final AppDatabase instance = AppDatabase._init();
  static Database? _database;

  AppDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'user_database.db');

    await deleteDatabase(path); //видалити базу даних

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    print(' Start Creating database...');
    await db.execute('''
    CREATE TABLE IF NOT EXISTS user (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      password TEXT NOT NULL,
      email TEXT NOT NULL
    )
  ''');
    print('User table created');

    await db.execute('''
    CREATE TABLE IF NOT EXISTS categories (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      colorValue INTEGER NOT NULL,
      iconPath TEXT NOT NULL,
      position INTEGER
    )
  ''');
    print('Categories table created');

    await db.execute('''
    CREATE TABLE IF NOT EXISTS transactions (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      financialAction TEXT NOT NULL,
      categoryId INTEGER NOT NULL,
      amount INTEGER NOT NULL,
      description TEXT,
      date TEXT NOT NULL,
      FOREIGN KEY (categoryId) REFERENCES categories (id) ON DELETE CASCADE
  )
  ''');
  //TODO:delete забрати !

    print('Categories table transaction');

    print('Database created !!!');
  }

 
}
