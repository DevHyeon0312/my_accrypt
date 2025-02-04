import 'package:my_accrypt/feature/accrypt/domain/entities/account_entity.dart';
import 'package:my_accrypt/feature/accrypt/domain/repositories/account_repository.dart';

class SaveAccountUseCase {
  final AccountRepository repository;

  SaveAccountUseCase(this.repository);

  Future<void> call(AccountEntity accountEntity) async {
    await repository.saveAccount(accountEntity);
  }
}