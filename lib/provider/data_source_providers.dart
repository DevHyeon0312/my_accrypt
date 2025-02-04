import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_accrypt/feature/accrypt/data/datasources/account_local_data_source.dart';
import 'package:my_accrypt/provider/common_providers.dart';

///
/// 📌 account Data Source Provider
///
final accountLocalDataSourceProvider = Provider<AccountLocalDataSource>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);
  return AccountLocalDataSource(sharedPreferences);
});