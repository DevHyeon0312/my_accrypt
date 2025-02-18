import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_accrypt/feature/accrypt/data/models/account.dart';
import 'package:my_accrypt/feature/accrypt/domain/usecases/account_use_case.dart';

class AccountAddViewModel extends StateNotifier<AccountAddViewModelState> {
  final AccountUseCase _accountUseCase;

  AccountAddViewModel(
    this._accountUseCase,
  ) : super(AccountAddViewModelState.empty());

  void updateAccount({
    String? userId,
    String? userName,
    String? userPassword,
    String? groupName,
    String? siteName,
    String? siteUrl,
    String? note,
  }) {
    var account = state.account.copyWith(
      userId: userId ?? state.account.userId ?? '',
      userName: userName ?? state.account.userName ?? '',
      userPassword: userPassword ?? state.account.userPassword ?? '',
      groupName: groupName ?? state.account.groupName ?? '',
      siteName: siteName ?? state.account.siteName ?? '',
      siteUrl: siteUrl ?? state.account.siteUrl ?? '',
      note: note ?? state.account.note ?? '',
    );
    state = state.copyWith(account: account);
  }

  Future<void> saveAccount() async {
    final account = Account(
      userId: state.account.userId ?? '',
      userName: state.account.userName ?? '',
      userPassword: state.account.userPassword ?? '',
      groupName: state.account.groupName ?? '',
      siteName: state.account.siteName ?? '',
      siteUrl: state.account.siteUrl ?? '',
      note: state.account.note ?? '',
      createdAt: state.account.createdAt ?? DateTime.now().toString(),
      updatedAt: DateTime.now().toString(),
    );
    await _accountUseCase.saveAccount(account);
  }
}

class AccountAddViewModelState {
  bool isProgressVisible;
  Account account;

  AccountAddViewModelState({
    required this.isProgressVisible,
    required this.account,
  });

  factory AccountAddViewModelState.empty() {
    return AccountAddViewModelState(
      isProgressVisible: false,
      account: const Account(
        userId: '',
        userName: '',
        userPassword: '',
        groupName: '',
        siteName: '',
        siteUrl: '',
        note: '',
        createdAt: '',
        updatedAt: '',
      ),
    );
  }

  AccountAddViewModelState copyWith({
    bool? isProgressVisible,
    Account? account,
  }) {
    return AccountAddViewModelState(
      isProgressVisible: isProgressVisible ?? this.isProgressVisible,
      account: account ?? this.account,
    );
  }
}
