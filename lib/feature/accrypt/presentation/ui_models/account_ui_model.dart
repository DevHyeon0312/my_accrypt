import 'package:my_accrypt/feature/accrypt/domain/enums/account_type.dart';

class AccountUiModel {
  String? uuid;
  AccountType accountType;
  String? groupName;
  String? userId;
  String? userPassword;
  String? userName;
  String? userPhone;
  String? siteName;
  String? siteUrl;
  String? note;
  String? createdAt;
  String? updatedAt;

  AccountUiModel({
    this.uuid,
    required this.accountType,
    required this.groupName,
    required this.userId,
    required this.userPassword,
    required this.userName,
    required this.userPhone,
    required this.siteName,
    required this.siteUrl,
    required this.note,
    required this.createdAt,
    required this.updatedAt,
  });

  //copyWith
  AccountUiModel copyWith({
    String? uuid,
    AccountType? accountType,
    String? groupName,
    String? userId,
    String? userPassword,
    String? userName,
    String? userPhone,
    String? siteName,
    String? siteUrl,
    String? note,
    String? createdAt,
    String? updatedAt,
  }) {
    return AccountUiModel(
      uuid: uuid ?? this.uuid,
      accountType: accountType ?? this.accountType,
      groupName: groupName ?? this.groupName,
      userId: userId ?? this.userId,
      userPassword: userPassword ?? this.userPassword,
      userName: userName ?? this.userName,
      userPhone: userPhone ?? this.userPhone,
      siteName: siteName ?? this.siteName,
      siteUrl: siteUrl ?? this.siteUrl,
      note: note ?? this.note,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  String toString() {
    return 'AccountUiModel{uuid: $uuid, accountType: $accountType, groupName: $groupName, userId: $userId, userPassword: $userPassword, userName: $userName, userPhone: $userPhone, siteName: $siteName, siteUrl: $siteUrl, note: $note, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}
