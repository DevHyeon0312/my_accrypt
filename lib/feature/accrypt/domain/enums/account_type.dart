enum AccountType {
  id(key: 'id'),
  email(key: 'email'),
  social(key: 'social'),
  unknown(key: 'unknown');

  static AccountType findAccountTypeByKey(String? key) {
    if (key == null || key.isEmpty) {
      return AccountType.unknown;
    }
    return AccountType.values.firstWhere((element) => element.key == key);
  }

  final String key;

  const AccountType({required this.key});
}