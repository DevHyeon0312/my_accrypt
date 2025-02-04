import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_accrypt/feature/accrypt/data/models/account.dart';

class AccountLocalDataSource {
  final SharedPreferences sharedPreferences;

  AccountLocalDataSource(this.sharedPreferences);

  Future<void> saveAccount(Account account) async {
    final jsonString = jsonEncode(account.toJson());
    await sharedPreferences.setString('account_${account.userId}', jsonString);
  }

  Future<Account?> getAccount(String id) async {
    final jsonString = sharedPreferences.getString('account_$id');
    if (jsonString == null) return null;
    return Account.fromJson(jsonDecode(jsonString));
  }

  Future<void> deleteAccount(String id) async {
    await sharedPreferences.remove('account_$id');
  }
}