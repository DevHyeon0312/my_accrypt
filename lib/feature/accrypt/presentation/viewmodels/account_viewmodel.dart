import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_accrypt/feature/accrypt/data/models/account.dart';
import 'package:my_accrypt/feature/accrypt/domain/entities/account_entity.dart';
import 'package:my_accrypt/feature/accrypt/domain/usecases/delete_account_use_case.dart';
import 'package:my_accrypt/feature/accrypt/domain/usecases/get_account_use_case.dart';
import 'package:my_accrypt/feature/accrypt/domain/usecases/save_account_use_case.dart';

class AccountViewModel extends StateNotifier<Account?> {
  final GetAccountUseCase _getAccountUseCase;
  final SaveAccountUseCase _saveAccountUseCase;
  final DeleteAccountUseCase _deleteAccountUseCase;

  AccountViewModel(
      this._getAccountUseCase,
      this._saveAccountUseCase,
      this._deleteAccountUseCase,
      ) : super(null);

  /// ✅ `id`를 기반으로 계정을 불러오는 메서드
  Future<void> fetchAccount(String id) async {
    final entity = await _getAccountUseCase(id);
    if (entity != null) {

    }
  }
}