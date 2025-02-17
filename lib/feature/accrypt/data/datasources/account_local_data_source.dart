import 'package:sqflite/sqflite.dart';
import 'package:my_accrypt/feature/accrypt/data/models/account.dart';

class AccountLocalDataSource {
  final Database database;

  AccountLocalDataSource(this.database);

  Future<void> saveAccount(Account account) async {
    final db = database;
    await db.insert(
      'accounts',
      {
        'user_id': account.userId,
        'group_name': account.groupName,
        'user_password': account.userPassword,
        'user_name': account.userName,
        'site_name': account.siteName,
        'site_url': account.siteUrl,
        'note': account.note,
        'created_at': account.createdAt,
        'updated_at': account.updatedAt,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Account?> getAccount(String userId) async {
    final db = database;
    final maps = await db.query(
      'accounts',
      where: 'user_id = ?',
      whereArgs: [userId],
      limit: 1,
    );

    if (maps.isNotEmpty) {
      return Account.fromJson(maps.first);
    }
    return null;
  }

  Future<List<Account>> getAccountList() async {
    final db = database;
    final maps = await db.query('accounts');
    return List.generate(maps.length, (i) {
      return Account.fromJson(maps[i]);
    });
  }

  Future<void> deleteAccount(String userId) async {
    final db = database;
    await db.delete(
      'accounts',
      where: 'user_id = ?',
      whereArgs: [userId],
    );
  }
}