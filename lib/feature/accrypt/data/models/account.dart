import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_accrypt/feature/accrypt/data/enums/account_types.dart';

part 'account.freezed.dart';
part 'account.g.dart';

@freezed
class Account with _$Account {
  const Account._();
  const factory Account({
    @JsonKey(name: 'uuid') required String uuid,
    @JsonKey(name: 'group_name') String? groupName,
    @JsonKey(name: 'account_type') AccountType? accountType,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'user_password') String? userPassword,
    @JsonKey(name: 'user_name') String? userName,
    @JsonKey(name: 'user_phone') String? userPhone,
    @JsonKey(name: 'site_name') String? siteName,
    @JsonKey(name: 'site_url') String? siteUrl,
    @JsonKey(name: 'note') String? note,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _Account;

  factory Account.fromJson(Map<String, Object?> json) => _$AccountFromJson(json);
}