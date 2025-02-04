import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_accrypt/feature/accrypt/data/models/account.dart';
import 'package:my_accrypt/feature/accrypt/presentation/viewmodels/account_viewmodel.dart';
import 'package:my_accrypt/provider/use_case_providers.dart';

///
/// 📌 account ViewModel Provider
///
final accountViewModelProvider = StateNotifierProvider<AccountViewModel, Account?>((ref) {
  final getAccountUseCase = ref.watch(getAccountUseCaseProvider);
  final saveAccountUseCase = ref.watch(saveAccountUseCaseProvider);
  final deleteAccountUseCase = ref.watch(deleteAccountUseCaseProvider);

  return AccountViewModel(getAccountUseCase, saveAccountUseCase, deleteAccountUseCase);
});