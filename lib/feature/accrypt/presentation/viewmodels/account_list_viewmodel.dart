import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_accrypt/common/utils/debug_log.dart';
import 'package:my_accrypt/feature/accrypt/data/models/account.dart';
import 'package:my_accrypt/feature/accrypt/domain/usecases/account_use_case.dart';

class AccountListViewmodel extends StateNotifier<AccountListViewModelState> {
  final AccountUseCase _accountUseCase;

  AccountListViewmodel(this._accountUseCase) : super(
    AccountListViewModelState.empty().copyWith(
      isProgressVisible: true,
    ),
  ) {
    getAccountList();
  }

  Future<void> getAccountList() async {
    final accountList = await _accountUseCase.getAccountList();
    state = state.copyWith(
      isProgressVisible: false,
      accountList: accountList,
    );
    DebugLog.i('accountList: $accountList');
  }
}

class AccountListViewModelState {
  bool isProgressVisible;
  List<Account> accountList;

  AccountListViewModelState({
    required this.isProgressVisible,
    required this.accountList,
  });

  factory AccountListViewModelState.empty() {
    return AccountListViewModelState(
      isProgressVisible: false,
      accountList: [],
    );
  }

  AccountListViewModelState copyWith({
    bool? isProgressVisible,
    List<Account>? accountList,
  }) {
    return AccountListViewModelState(
      isProgressVisible: isProgressVisible ?? this.isProgressVisible,
      accountList: accountList ?? this.accountList,
    );
  }
}