import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_accrypt/feature/accrypt/domain/usecases/account_use_case.dart';
import 'package:my_accrypt/provider/repository_providers.dart';

///
/// 📌 account UseCase Provider
///
final accountUseCaseProvider = Provider.autoDispose<AccountUseCase>((ref) {
  final repository = ref.watch(accountRepositoryProvider);
  return AccountUseCase(repository);
});