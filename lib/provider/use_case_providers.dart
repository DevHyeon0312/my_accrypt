import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_accrypt/feature/accrypt/domain/usecases/delete_account_use_case.dart';
import 'package:my_accrypt/feature/accrypt/domain/usecases/get_account_use_case.dart';
import 'package:my_accrypt/feature/accrypt/domain/usecases/save_account_use_case.dart';
import 'package:my_accrypt/provider/repository_providers.dart';

///
/// 📌 account UseCase Provider
///
final getAccountUseCaseProvider = Provider<GetAccountUseCase>((ref) {
  final repository = ref.watch(accountRepositoryProvider);
  return GetAccountUseCase(repository);
});

final saveAccountUseCaseProvider = Provider<SaveAccountUseCase>((ref) {
  final repository = ref.watch(accountRepositoryProvider);
  return SaveAccountUseCase(repository);
});

final deleteAccountUseCaseProvider = Provider<DeleteAccountUseCase>((ref) {
  final repository = ref.watch(accountRepositoryProvider);
  return DeleteAccountUseCase(repository);
});
