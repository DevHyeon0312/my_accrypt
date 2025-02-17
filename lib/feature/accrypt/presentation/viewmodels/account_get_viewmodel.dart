import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_accrypt/common/utils/debug_log.dart';
import 'package:my_accrypt/feature/accrypt/data/models/account.dart';
import 'package:my_accrypt/feature/accrypt/domain/usecases/account_use_case.dart';

class AccountGetViewmodel extends StateNotifier<List<Account>> {
  final AccountUseCase _accountUseCase;

  AccountGetViewmodel(this._accountUseCase) : super([]);

  Future<void> getAccountList() async {
    final accountList = await _accountUseCase.getAccountList();
    state = accountList;
    DebugLog.i('accountList: $accountList');
  }
}