import 'package:my_accrypt/common/utils/uuid_util.dart';
import 'package:my_accrypt/feature/accrypt/domain/enums/account_type.dart';
import 'package:my_accrypt/feature/accrypt/domain/entities/account_entity.dart';
import 'package:my_accrypt/feature/accrypt/domain/repositories/account_repository.dart';

class AccountUseCase {
  final AccountRepository repository;

  AccountUseCase(this.repository);

  Future<bool> isAccountValid({
    required AccountEntity accountEntity,
  }) {
    return Future.value(
      (accountEntity.userId ?? '').isNotEmpty &&
          (accountEntity.userPassword ?? '').isNotEmpty &&
          (accountEntity.siteName ?? '').isNotEmpty,
    );
  }

  Future<void> saveAccount({
    required AccountEntity accountEntity,
  }) async {
    return await repository.saveAccount(
      accountEntity,
    );
  }

  Future<AccountEntity?> getAccount({required String uuid}) async {
    var accountEntity = await repository.getAccount(uuid);
    if (accountEntity == null) return null;
    return AccountEntity(
      uuid: accountEntity.uuid,
      accountType: accountEntity.accountType,
      groupName: accountEntity.groupName,
      userId: accountEntity.userId,
      userPassword: accountEntity.userPassword,
      userName: accountEntity.userName,
      userPhone: accountEntity.userPhone,
      siteName: accountEntity.siteName,
      siteUrl: accountEntity.siteUrl,
      note: accountEntity.note,
      createdAt: accountEntity.createdAt,
      updatedAt: accountEntity.updatedAt,
    );
  }

  Future<List<AccountEntity>> getAccountList() async {
    var accountList = await repository.getAccountList();
    return accountList.map((accountEntity) {
      return AccountEntity(
        uuid: accountEntity.uuid,
        accountType: accountEntity.accountType,
        groupName: accountEntity.groupName,
        userId: accountEntity.userId,
        userPassword: accountEntity.userPassword,
        userName: accountEntity.userName,
        userPhone: accountEntity.userPhone,
        siteName: accountEntity.siteName,
        siteUrl: accountEntity.siteUrl,
        note: accountEntity.note,
        createdAt: accountEntity.createdAt,
        updatedAt: accountEntity.updatedAt,
      );
    }).toList();
  }
}
