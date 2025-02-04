import 'package:my_accrypt/feature/accrypt/domain/entities/account_entity.dart';
import 'package:my_accrypt/feature/accrypt/domain/repositories/account_repository.dart';

class GetAccountUseCase {
  final AccountRepository repository;

  GetAccountUseCase(this.repository);

  Future<AccountEntity?> call(String id) async {
    return await repository.getAccount(id);
  }
}