import 'package:flutter/foundation.dart' show immutable;
import 'package:my_accrypt/feature/accrypt/domain/enums/account_type.dart';

@immutable
class AccountEntity {
  const AccountEntity({
    required this.uuid,
    required this.groupName,
    required this.accountType,
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

  final String uuid;  /// UUID
  final String groupName; /// 계정 그룹 이름
  final AccountType accountType; /// 계정 타입
  final String userId; /// 사용자 ID
  final String userPassword; /// 사용자 비밀번호
  final String userName; /// 사용자 이름
  final String userPhone; /// 사용자 전화번호
  final String siteName; /// 사이트 이름
  final String siteUrl; /// 사이트 URL
  final String note; /// 메모
  final String createdAt; /// 생성일
  final String updatedAt; /// 수정일

  @override
  String toString() {
    return 'AccountEntity{uuid: $uuid, groupName: $groupName, accountType: $accountType, userId: $userId, userPassword: $userPassword, userName: $userName, userPhone: $userPhone, siteName: $siteName, siteUrl: $siteUrl, note: $note, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}
