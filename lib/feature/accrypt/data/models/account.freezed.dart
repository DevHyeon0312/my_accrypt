// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Account _$AccountFromJson(Map<String, dynamic> json) {
  return _Account.fromJson(json);
}

/// @nodoc
mixin _$Account {
  @JsonKey(name: 'uuid')
  String get uuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'group_name')
  String? get groupName => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_type')
  AccountType? get accountType => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_password')
  String? get userPassword => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_name')
  String? get userName => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_phone')
  String? get userPhone => throw _privateConstructorUsedError;
  @JsonKey(name: 'site_name')
  String? get siteName => throw _privateConstructorUsedError;
  @JsonKey(name: 'site_url')
  String? get siteUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'note')
  String? get note => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Account to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountCopyWith<Account> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountCopyWith<$Res> {
  factory $AccountCopyWith(Account value, $Res Function(Account) then) =
      _$AccountCopyWithImpl<$Res, Account>;
  @useResult
  $Res call(
      {@JsonKey(name: 'uuid') String uuid,
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
      @JsonKey(name: 'updated_at') String? updatedAt});
}

/// @nodoc
class _$AccountCopyWithImpl<$Res, $Val extends Account>
    implements $AccountCopyWith<$Res> {
  _$AccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? groupName = freezed,
    Object? accountType = freezed,
    Object? userId = freezed,
    Object? userPassword = freezed,
    Object? userName = freezed,
    Object? userPhone = freezed,
    Object? siteName = freezed,
    Object? siteUrl = freezed,
    Object? note = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      accountType: freezed == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as AccountType?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      userPassword: freezed == userPassword
          ? _value.userPassword
          : userPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      userPhone: freezed == userPhone
          ? _value.userPhone
          : userPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      siteName: freezed == siteName
          ? _value.siteName
          : siteName // ignore: cast_nullable_to_non_nullable
              as String?,
      siteUrl: freezed == siteUrl
          ? _value.siteUrl
          : siteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountImplCopyWith<$Res> implements $AccountCopyWith<$Res> {
  factory _$$AccountImplCopyWith(
          _$AccountImpl value, $Res Function(_$AccountImpl) then) =
      __$$AccountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'uuid') String uuid,
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
      @JsonKey(name: 'updated_at') String? updatedAt});
}

/// @nodoc
class __$$AccountImplCopyWithImpl<$Res>
    extends _$AccountCopyWithImpl<$Res, _$AccountImpl>
    implements _$$AccountImplCopyWith<$Res> {
  __$$AccountImplCopyWithImpl(
      _$AccountImpl _value, $Res Function(_$AccountImpl) _then)
      : super(_value, _then);

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? groupName = freezed,
    Object? accountType = freezed,
    Object? userId = freezed,
    Object? userPassword = freezed,
    Object? userName = freezed,
    Object? userPhone = freezed,
    Object? siteName = freezed,
    Object? siteUrl = freezed,
    Object? note = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$AccountImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      groupName: freezed == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String?,
      accountType: freezed == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as AccountType?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      userPassword: freezed == userPassword
          ? _value.userPassword
          : userPassword // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      userPhone: freezed == userPhone
          ? _value.userPhone
          : userPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      siteName: freezed == siteName
          ? _value.siteName
          : siteName // ignore: cast_nullable_to_non_nullable
              as String?,
      siteUrl: freezed == siteUrl
          ? _value.siteUrl
          : siteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountImpl extends _Account {
  const _$AccountImpl(
      {@JsonKey(name: 'uuid') required this.uuid,
      @JsonKey(name: 'group_name') this.groupName,
      @JsonKey(name: 'account_type') this.accountType,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'user_password') this.userPassword,
      @JsonKey(name: 'user_name') this.userName,
      @JsonKey(name: 'user_phone') this.userPhone,
      @JsonKey(name: 'site_name') this.siteName,
      @JsonKey(name: 'site_url') this.siteUrl,
      @JsonKey(name: 'note') this.note,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt})
      : super._();

  factory _$AccountImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountImplFromJson(json);

  @override
  @JsonKey(name: 'uuid')
  final String uuid;
  @override
  @JsonKey(name: 'group_name')
  final String? groupName;
  @override
  @JsonKey(name: 'account_type')
  final AccountType? accountType;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  @JsonKey(name: 'user_password')
  final String? userPassword;
  @override
  @JsonKey(name: 'user_name')
  final String? userName;
  @override
  @JsonKey(name: 'user_phone')
  final String? userPhone;
  @override
  @JsonKey(name: 'site_name')
  final String? siteName;
  @override
  @JsonKey(name: 'site_url')
  final String? siteUrl;
  @override
  @JsonKey(name: 'note')
  final String? note;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @override
  String toString() {
    return 'Account(uuid: $uuid, groupName: $groupName, accountType: $accountType, userId: $userId, userPassword: $userPassword, userName: $userName, userPhone: $userPhone, siteName: $siteName, siteUrl: $siteUrl, note: $note, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.accountType, accountType) ||
                other.accountType == accountType) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userPassword, userPassword) ||
                other.userPassword == userPassword) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.userPhone, userPhone) ||
                other.userPhone == userPhone) &&
            (identical(other.siteName, siteName) ||
                other.siteName == siteName) &&
            (identical(other.siteUrl, siteUrl) || other.siteUrl == siteUrl) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uuid,
      groupName,
      accountType,
      userId,
      userPassword,
      userName,
      userPhone,
      siteName,
      siteUrl,
      note,
      createdAt,
      updatedAt);

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountImplCopyWith<_$AccountImpl> get copyWith =>
      __$$AccountImplCopyWithImpl<_$AccountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountImplToJson(
      this,
    );
  }
}

abstract class _Account extends Account {
  const factory _Account(
      {@JsonKey(name: 'uuid') required final String uuid,
      @JsonKey(name: 'group_name') final String? groupName,
      @JsonKey(name: 'account_type') final AccountType? accountType,
      @JsonKey(name: 'user_id') final String? userId,
      @JsonKey(name: 'user_password') final String? userPassword,
      @JsonKey(name: 'user_name') final String? userName,
      @JsonKey(name: 'user_phone') final String? userPhone,
      @JsonKey(name: 'site_name') final String? siteName,
      @JsonKey(name: 'site_url') final String? siteUrl,
      @JsonKey(name: 'note') final String? note,
      @JsonKey(name: 'created_at') final String? createdAt,
      @JsonKey(name: 'updated_at') final String? updatedAt}) = _$AccountImpl;
  const _Account._() : super._();

  factory _Account.fromJson(Map<String, dynamic> json) = _$AccountImpl.fromJson;

  @override
  @JsonKey(name: 'uuid')
  String get uuid;
  @override
  @JsonKey(name: 'group_name')
  String? get groupName;
  @override
  @JsonKey(name: 'account_type')
  AccountType? get accountType;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  @JsonKey(name: 'user_password')
  String? get userPassword;
  @override
  @JsonKey(name: 'user_name')
  String? get userName;
  @override
  @JsonKey(name: 'user_phone')
  String? get userPhone;
  @override
  @JsonKey(name: 'site_name')
  String? get siteName;
  @override
  @JsonKey(name: 'site_url')
  String? get siteUrl;
  @override
  @JsonKey(name: 'note')
  String? get note;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountImplCopyWith<_$AccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
