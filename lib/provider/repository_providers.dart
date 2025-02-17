import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_accrypt/feature/accrypt/data/repositories/account_repository_impl.dart';
import 'package:my_accrypt/provider/data_source_providers.dart';

///
/// 📌 account Repository Provider
///
final accountRepositoryProvider = Provider.autoDispose<AccountRepositoryImpl>((ref) {
  final localDataSource = ref.watch(accountLocalDataSourceProvider);
  return AccountRepositoryImpl(localDataSource);
});
