import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_accrypt/main_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import 'app/my_accrypt_app.dart';

/// 테스트중
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();
  final database = await openDatabase(
    'accounts.db',
    version: 1,
    onCreate: (db, version) {
      return db.execute(
          '''
        CREATE TABLE accounts(
          uuid TEXT PRIMARY KEY,
          account_type_key TEXT,
          group_name TEXT,
          user_id TEXT,
          user_password TEXT,
          user_name TEXT,
          user_phone TEXT,
          site_name TEXT,
          site_url TEXT,
          note TEXT,
          created_at TEXT,
          updated_at TEXT
        )
        '''
      );
    },
  );

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
        accountDatabaseProvider.overrideWithValue(database),
      ],
      child: const MyAccryptApp(),
    ),
  );
}