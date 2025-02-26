// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountImpl _$$AccountImplFromJson(Map<String, dynamic> json) =>
    _$AccountImpl(
      uuid: json['uuid'] as String,
      groupName: json['group_name'] as String?,
      accountTypeKey: json['account_type_key'] as String?,
      userId: json['user_id'] as String?,
      userPassword: json['user_password'] as String?,
      userName: json['user_name'] as String?,
      userPhone: json['user_phone'] as String?,
      siteName: json['site_name'] as String?,
      siteUrl: json['site_url'] as String?,
      note: json['note'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$AccountImplToJson(_$AccountImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'group_name': instance.groupName,
      'account_type_key': instance.accountTypeKey,
      'user_id': instance.userId,
      'user_password': instance.userPassword,
      'user_name': instance.userName,
      'user_phone': instance.userPhone,
      'site_name': instance.siteName,
      'site_url': instance.siteUrl,
      'note': instance.note,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
