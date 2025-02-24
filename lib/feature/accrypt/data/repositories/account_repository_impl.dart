import 'package:my_accrypt/feature/accrypt/data/datasources/account_local_data_source.dart';
import 'package:my_accrypt/feature/accrypt/data/enums/account_types.dart';
import 'package:my_accrypt/feature/accrypt/domain/entities/account_entity.dart';
import 'package:my_accrypt/feature/accrypt/domain/repositories/account_repository.dart';
import 'package:my_accrypt/feature/accrypt/data/models/account.dart';

class AccountRepositoryImpl implements AccountRepository {
  final AccountLocalDataSource localDataSource;

  AccountRepositoryImpl(this.localDataSource);

  @override
  Future<void> saveAccount(AccountEntity accountEntity) async {
    final account = Account(
      uuid: accountEntity.uuid,
      groupName: accountEntity.groupName,
      accountType: AccountType.findAccountTypeByKey(accountEntity.accountTypeKey),
      userName: accountEntity.userName,
      userId: accountEntity.userId,
      userPassword: accountEntity.userPassword,
      userPhone: accountEntity.userPhone,
      siteName: accountEntity.siteName,
      siteUrl: accountEntity.siteUrl,
      note: accountEntity.note,
      createdAt: accountEntity.createdAt,
      updatedAt: accountEntity.updatedAt,
    );
    await localDataSource.saveAccount(account);
  }

  @override
  Future<AccountEntity?> getAccount(String uuid) async {
    final account = await localDataSource.getAccount(uuid);
    if (account == null) return null;
    return AccountEntity(
      uuid: account.uuid,
      groupName: account.groupName ?? '',
      accountTypeKey: account.accountType?.key ?? '',
      userName: account.userName ?? '',
      userId: account.userId ?? '',
      userPassword: account.userPassword ?? '',
      userPhone: account.userPhone ?? '',
      siteName: account.siteName ?? '',
      siteUrl: account.siteUrl ?? '',
      note: account.note ?? '',
      createdAt: account.createdAt ?? '',
      updatedAt: account.updatedAt ?? '',
    );
  }

  @override
  Future<List<AccountEntity>> getAccountList() async {
    final accountList = await localDataSource.getAccountList();
    return accountList.map((account) {
      return AccountEntity(
        uuid: account.uuid,
        groupName: account.groupName ?? '',
        accountTypeKey: account.accountType?.key ?? '',
        userName: account.userName ?? '',
        userId: account.userId ?? '',
        userPassword: account.userPassword ?? '',
        userPhone: account.userPhone ?? '',
        siteName: account.siteName ?? '',
        siteUrl: account.siteUrl ?? '',
        note: account.note ?? '',
        createdAt: account.createdAt ?? '',
        updatedAt: account.updatedAt ?? '',
      );
    }).toList();
  }

  @override
  Future<void> deleteAccount(String id) async {
    await localDataSource.deleteAccount(id);
  }
}