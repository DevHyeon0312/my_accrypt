import 'package:my_accrypt/common/utils/uuid_util.dart';
import 'package:my_accrypt/feature/accrypt/domain/entities/account_entity.dart';
import 'package:my_accrypt/feature/accrypt/presentation/ui_models/account_ui_model.dart';

extension AccountUiModelMapper on AccountUiModel {
  AccountEntity toEntity() => AccountEntity(
    uuid: uuid ?? UuidUtil.generateV7(),
    accountType: accountType,
    groupName: groupName ?? '',
    userId: userId ?? '',
    userPassword: userPassword ?? '',
    userName: userName ?? '',
    userPhone: userPhone ?? '',
    siteName: siteName ?? '',
    siteUrl: siteUrl ?? '',
    note: note ?? '',
    createdAt: createdAt ?? '',
    updatedAt: updatedAt ?? '',
  );
}