import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_accrypt/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/my_accrypt_app.dart';

/// 테스트중
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: const MyAccryptApp(),
    ),
  );
}