import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_accrypt/feature/accrypt/data/models/account.dart';
import 'package:my_accrypt/feature/accrypt/domain/usecases/account_use_case.dart';

class AccountAddViewModel extends StateNotifier<Account> {
  final AccountUseCase _accountUseCase;

  AccountAddViewModel(
    this._accountUseCase,
  ) : super(
          const Account(
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

  void updateAccount({
    String? userId,
    String? userName,
    String? userPassword,
    String? groupName,
    String? siteName,
    String? siteUrl,
    String? note,
  }) {
    state = state.copyWith(
      userId: userId ?? state.userId ?? '',
      userName: userName ?? state.userName ?? '',
      userPassword: userPassword ?? state.userPassword ?? '',
      groupName: groupName ?? state.groupName ?? '',
      siteName: siteName ?? state.siteName ?? '',
      siteUrl: siteUrl ?? state.siteUrl ?? '',
      note: note ?? state.note ?? '',
    );
  }

  Future<void> saveAccount() async {
    final accountEntity = Account(
      userId: state.userId ?? '',
      userName: state.userName ?? '',
      userPassword: state.userPassword ?? '',
      groupName: state.groupName ?? '',
      siteName: state.siteName ?? '',
      siteUrl: state.siteUrl ?? '',
      note: state.note ?? '',
      createdAt: DateTime.now().toString(),
      updatedAt: DateTime.now().toString(),
    );
    await _accountUseCase.saveAccount(accountEntity);
  }
}
