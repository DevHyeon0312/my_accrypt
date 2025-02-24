class AccountUiModel {
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
}