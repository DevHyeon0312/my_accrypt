import 'dart:async';

import 'package:my_accrypt/common/utils/debug_log.dart';
import 'package:sqflite/sqflite.dart';
import 'package:my_accrypt/feature/accrypt/data/models/account.dart';

class AccountLocalDataSource {
  final Database database;
  final StreamController<void> _changeController = StreamController.broadcast();
  Stream<void> get onChange => _changeController.stream;

  AccountLocalDataSource(this.database);

  void dispose() {
    _changeController.close();
  }

  Future<void> saveAccount(Account account) async {
    final db = database;
    await db.insert(
      'accounts',
      {
        'uuid': account.uuid,
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
    _changeController.add(null);
  }

  Future<Account?> getAccount(String uuid) async {
    final db = database;
    final maps = await db.query(
      'accounts',
      where: 'uuid = ?',
      whereArgs: [uuid],
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
    var nullableList = List.generate(maps.length, (i) {
      try {
        DebugLog.d('${maps[i]}');
        return Account.fromJson(maps[i]);
      } catch (e) {
        return null;
      }
    });
    return nullableList.where((element) => element != null).toList().cast<Account>();
  }

  Future<void> deleteAccount(String userId) async {
    final db = database;
    await db.delete(
      'accounts',
      where: 'uuid = ?',
      whereArgs: [userId],
    );
    _changeController.add(null);
  }
}