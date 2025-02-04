import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.freezed.dart';
part 'account.g.dart';

@freezed
class Account with _$Account {
  const Account._();
  const factory Account({
    @JsonKey(name: 'group_name') required String? groupName,
    @JsonKey(name: 'user_id') required String? userId,
    @JsonKey(name: 'user_password') required String? userPassword,
    @JsonKey(name: 'user_name') required String? userName,
    @JsonKey(name: 'site_name') required String? siteName,
    @JsonKey(name: 'site_url') required String? siteUrl,
    @JsonKey(name: 'note') required String? note,
    @JsonKey(name: 'created_at') required String? createdAt,
    @JsonKey(name: 'updated_at') required String? updatedAt,
  }) = _Account;

  factory Account.fromJson(Map<String, Object?> json) => _$AccountFromJson(json);
}