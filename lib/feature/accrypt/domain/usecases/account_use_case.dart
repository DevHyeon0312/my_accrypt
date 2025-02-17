import 'package:my_accrypt/common/utils/debug_log.dart';
import 'package:my_accrypt/feature/accrypt/data/repositories/account_repository_impl.dart';
import 'package:my_accrypt/feature/accrypt/domain/entities/account_entity.dart';

class AccountUseCase {
  final AccountRepositoryImpl repository;

  AccountUseCase(this.repository);

  Future<void> saveAccount(AccountEntity accountEntity) async {
    DebugLog.i('$accountEntity');
    // UseCase 내부에서 비즈니스 로직 수행 가능
    if (accountEntity.userPassword.length < 6) {
      DebugLog.e('비밀번호는 6자 이상이어야 합니다.');
    }
    await repository.saveAccount(accountEntity);
  }

  Future<AccountEntity?> getAccount(String id) async {
    return await repository.getAccount(id);
  }

}