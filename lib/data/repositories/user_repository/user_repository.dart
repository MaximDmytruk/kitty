import 'package:kitty/data/database/database.dart';
import 'package:kitty/data/models/user/user.dart';

class UserRepository {
  final AppDatabase dbHelper = AppDatabase.instance;

  Future<User?> getUser() async {
    final db = await dbHelper.database;
    final result = await db.query('user');

    if (result.isNotEmpty) {
      return User.fromJson(result.first);
    }
    return null;
  }

  Future<void> registerUser({required User user}) async {
    final db = await dbHelper.database;
    final registeredUser = await getUser();

    if (registeredUser == null) {
      await db.insert('user', user.toJson());
    }
  }

  Future<void> updateUser(User user) async {
    final db = await dbHelper.database;
    await db.update(
      'user',
      user.toJson(),
    );
  }

  Future<void> removeUser() async {
    final db = await dbHelper.database;
    await db.delete('user');
  }
}
