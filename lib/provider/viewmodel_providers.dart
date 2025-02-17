import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_accrypt/feature/accrypt/data/models/account.dart';
import 'package:my_accrypt/feature/accrypt/presentation/viewmodels/account_add_viewmodel.dart';
import 'package:my_accrypt/provider/use_case_providers.dart';

///
/// 📌 account ViewModel Provider
///
final accountAddViewModelProvider = StateNotifierProvider.autoDispose<AccountAddViewModel, Account>((ref) {
  final useCase = ref.watch(accountUseCaseProvider);
  return AccountAddViewModel(useCase);
});
