import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_accrypt/feature/accrypt/presentation/viewmodels/account_add_viewmodel.dart';
import 'package:my_accrypt/feature/accrypt/presentation/viewmodels/account_detail_viewmodel.dart';
import 'package:my_accrypt/feature/accrypt/presentation/viewmodels/account_list_viewmodel.dart';
import 'package:my_accrypt/provider/use_case_providers.dart';

///
/// 📌 account ViewModel Provider
///
final accountAddViewModelProvider = StateNotifierProvider.autoDispose<
    AccountAddViewModel, AccountAddViewModelState>((ref) {
  final useCase = ref.watch(accountUseCaseProvider);
  return AccountAddViewModel(useCase);
});

final accountListViewmodelProvider = StateNotifierProvider.autoDispose<
    AccountListViewmodel, AccountListViewModelState>((ref) {
  final useCase = ref.watch(accountUseCaseProvider);
  return AccountListViewmodel(useCase);
});

final accountDetailViewModelProvider = StateNotifierProvider.autoDispose.family<
    AccountDetailViewModel, AccountDetailViewModelState, Map<String, dynamic>>((ref, args) {
  final useCase = ref.watch(accountUseCaseProvider);
  return AccountDetailViewModel(useCase, args);
});