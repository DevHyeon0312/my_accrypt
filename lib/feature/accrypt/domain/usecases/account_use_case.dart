import 'package:my_accrypt/common/utils/uuid_util.dart';
import 'package:my_accrypt/feature/accrypt/data/enums/account_types.dart';
import 'package:my_accrypt/feature/accrypt/data/repositories/account_repository_impl.dart';
import 'package:my_accrypt/feature/accrypt/domain/entities/account_entity.dart';
import 'package:my_accrypt/feature/accrypt/presentation/ui_models/account_ui_model.dart';

class AccountUseCase {
  final AccountRepositoryImpl repository;

  AccountUseCase(this.repository);

  Future<bool> isAccountValid({
    required AccountUiModel accountUiModel,
    required AccountType accountType,
  }) {
    if (accountType == AccountType.id) {
      return Future.value(
        (accountUiModel.userId ?? '').isNotEmpty &&
        (accountUiModel.userPassword ?? '').isNotEmpty &&
        (accountUiModel.siteName ?? '').isNotEmpty,
      );
    } else if (accountType == AccountType.email) {
      return Future.value(
        (accountUiModel.userId ?? '').isNotEmpty &&
        (accountUiModel.userPassword ?? '').isNotEmpty &&
        (accountUiModel.siteName ?? '').isNotEmpty,
      );
    } else {
      return Future.value(
        (accountUiModel.userId ?? '').isNotEmpty &&
        (accountUiModel.userPassword ?? '').isNotEmpty &&
        (accountUiModel.siteName ?? '').isNotEmpty,
      );
    }
  }

  Future<void> saveAccount({
    required AccountUiModel accountUiModel,
    required AccountType accountType,
  }) async {
    var accountEntity = AccountEntity(
      uuid: accountUiModel.uuid ?? UuidUtil.generateV7(),
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

  Future<AccountUiModel?> getAccount({required String uuid}) async {
    var accountEntity = await repository.getAccount(uuid);
    if (accountEntity == null) return null;
    return AccountUiModel(
      uuid: accountEntity.uuid,
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
        uuid: accountEntity.uuid,
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
