import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_accrypt/feature/accrypt/data/datasources/account_local_data_source.dart';
import 'package:my_accrypt/main_provider.dart';

/// 📌 **AccountLocalDataSource Provider**
final accountLocalDataSourceProvider = Provider.autoDispose<AccountLocalDataSource>((ref) {
  final database = ref.watch(accountDatabaseProvider);
  return AccountLocalDataSource(database);
});
