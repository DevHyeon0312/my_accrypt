import 'package:flutter/foundation.dart' show immutable;

@immutable
class AccountEntity {
  const AccountEntity({
    required this.groupName,
    required this.accountTypeKey,
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

  final String groupName; /// 계정 그룹 이름
  final String accountTypeKey; /// 계정 타입
  final String userId; /// 사용자 ID
  final String userPassword; /// 사용자 비밀번호
  final String userName; /// 사용자 이름
  final String userPhone; /// 사용자 전화번호
  final String siteName; /// 사이트 이름
  final String siteUrl; /// 사이트 URL
  final String note; /// 메모
  final String createdAt; /// 생성일
  final String updatedAt; /// 수정일
}
