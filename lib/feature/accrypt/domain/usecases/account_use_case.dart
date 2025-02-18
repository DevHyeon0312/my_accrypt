import 'package:my_accrypt/feature/accrypt/data/models/account.dart';
import 'package:my_accrypt/feature/accrypt/data/repositories/account_repository_impl.dart';
import 'package:my_accrypt/feature/accrypt/domain/entities/account_entity.dart';

class AccountUseCase {
  final AccountRepositoryImpl repository;

  AccountUseCase(this.repository);

  Future<void> saveAccount(Account account) async {
    var accountEntity = AccountEntity(
      groupName: account.groupName ?? '',
      userId: account.userId ?? '',
      userPassword: account.userPassword ?? '',
      userName: account.userName ?? '',
      siteName: account.siteName ?? '',
      siteUrl: account.siteUrl ?? '',
      note: account.note ?? '',
      createdAt: account.createdAt ?? '',
      updatedAt: account.updatedAt ?? '',
    );
    await repository.saveAccount(
      accountEntity,
    );
  }

  Future<Account?> getAccount(String id) async {
    //
    var accountEntity = await repository.getAccount(id);
    if (accountEntity == null) return null;
    return Account(
      groupName: accountEntity.groupName ?? '',
      userId: accountEntity.userId ?? '',
      userPassword: accountEntity.userPassword ?? '',
      userName: accountEntity.userName ?? '',
      siteName: accountEntity.siteName ?? '',
      siteUrl: accountEntity.siteUrl ?? '',
      note: accountEntity.note ?? '',
      createdAt: accountEntity.createdAt ?? '',
      updatedAt: accountEntity.updatedAt ?? '',
    );
  }

  Future<List<Account>> getAccountList() async {
    var accountList = await repository.getAccountList();
    return accountList.map((accountEntity) {
      return Account(
        groupName: accountEntity.groupName ?? '',
        userId: accountEntity.userId ?? '',
        userPassword: accountEntity.userPassword ?? '',
        userName: accountEntity.userName ?? '',
        siteName: accountEntity.siteName ?? '',
        siteUrl: accountEntity.siteUrl ?? '',
        note: accountEntity.note ?? '',
        createdAt: accountEntity.createdAt ?? '',
        updatedAt: accountEntity.updatedAt ?? '',
      );
    }).toList();
  }
}
