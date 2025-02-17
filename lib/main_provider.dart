import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError(); // `main.dart`에서 초기화 필요
});

// ✅ `Database` Provider
final accountDatabaseProvider = Provider<Database>((ref) {
  throw UnimplementedError(); // `main.dart`에서 반드시 초기화해야 함
});