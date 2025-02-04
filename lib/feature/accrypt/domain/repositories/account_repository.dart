import 'package:my_accrypt/feature/accrypt/domain/entities/account_entity.dart';

abstract class AccountRepository {
  Future<void> saveAccount(AccountEntity accountEntity);
  Future<AccountEntity?> getAccount(String id);
  Future<void> deleteAccount(String id);
}