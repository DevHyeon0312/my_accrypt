import 'package:my_accrypt/feature/accrypt/data/enums/account_types.dart';
import 'package:my_accrypt/feature/accrypt/data/repositories/account_repository_impl.dart';
import 'package:my_accrypt/feature/accrypt/domain/entities/account_entity.dart';
import 'package:my_accrypt/feature/accrypt/presentation/ui_models/account_ui_model.dart';

class AccountUseCase {
  final AccountRepositoryImpl repository;

  AccountUseCase(this.repository);

  Future<void> saveAccount({
    required AccountUiModel accountUiModel,
    required AccountType accountType,
  }) async {
    var accountEntity = AccountEntity(
      groupName: accountUiModel.groupName ?? '',
      accountTypeKey: accountType.key,
      userId: accountUiModel.userId ?? '',
      userPassword: accountUiModel.userPassword ?? '',
      userName: accountUiModel.userName ?? '',
      userPhone: accountUiModel.userPhone ?? '',
      siteName: accountUiModel.siteName ?? '',
      siteUrl: accountUiModel.siteUrl ?? '',
      note: accountUiModel.note ?? '',
      createdAt: accountUiModel.createdAt ?? '',
      updatedAt: accountUiModel.updatedAt ?? '',
    );
    await repository.saveAccount(
      accountEntity,
    );
  }

  Future<AccountUiModel?> getAccount(String id) async {
    //
    var accountEntity = await repository.getAccount(id);
    if (accountEntity == null) return null;
    return AccountUiModel(
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

  Future<List<AccountUiModel>> getAccountList() async {
    var accountList = await repository.getAccountList();
    return accountList.map((accountEntity) {
      return AccountUiModel(
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
