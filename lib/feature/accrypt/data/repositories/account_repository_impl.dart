import 'package:my_accrypt/feature/accrypt/data/datasources/account_local_data_source.dart';
import 'package:my_accrypt/feature/accrypt/domain/entities/account_entity.dart';
import 'package:my_accrypt/feature/accrypt/domain/repositories/account_repository.dart';
import 'package:my_accrypt/feature/accrypt/data/models/account.dart';

class AccountRepositoryImpl implements AccountRepository {
  final AccountLocalDataSource localDataSource;

  AccountRepositoryImpl(this.localDataSource);

  @override
  Future<void> saveAccount(AccountEntity accountEntity) async {
    final account = Account(
      groupName: accountEntity.groupName,
      userName: accountEntity.userName,
      userId: accountEntity.userId,
      userPassword: accountEntity.userPassword,
      siteName: accountEntity.siteName,
      siteUrl: accountEntity.siteUrl,
      note: accountEntity.note,
      createdAt: accountEntity.createdAt,
      updatedAt: accountEntity.updatedAt,
    );
    await localDataSource.saveAccount(account);
  }

  @override
  Future<AccountEntity?> getAccount(String id) async {
    final account = await localDataSource.getAccount(id);
    if (account == null) return null;
    return AccountEntity(
      groupName: account.groupName ?? '',
      userName: account.userName ?? '',
      userId: account.userId ?? '',
      userPassword: account.userPassword ?? '',
      siteName: account.siteName ?? '',
      siteUrl: account.siteUrl ?? '',
      note: account.note ?? '',
      createdAt: account.createdAt ?? '',
      updatedAt: account.updatedAt ?? '',
    );
  }

  @override
  Future<void> deleteAccount(String id) async {
    await localDataSource.deleteAccount(id);
  }
}