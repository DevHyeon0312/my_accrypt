import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_accrypt/app/route/app_route.dart';
import 'package:my_accrypt/common/base/base_scaffold.dart';
import 'package:my_accrypt/common/utils/debug_log.dart';
import 'package:my_accrypt/common/utils/platform_util.dart';
import 'package:my_accrypt/di.dart';
import 'package:my_accrypt/feature/accrypt/presentation/widgets/account_user_input_widget.dart';

class AccountAddPage extends ConsumerWidget {
  const AccountAddPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountNotifier = ref.read(accountAddViewModelProvider.notifier);
    return BaseScaffold(
      canPop: AppRoute.accountAdd.canPop,
      appBar: AppBar(
        title: const Text('Account Add Page'),
        centerTitle: true,
        leading: const SizedBox.shrink(),
        leadingWidth: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Consumer(builder: (context, ref, child) {
              final siteName = ref.watch(accountAddViewModelProvider.select((value) => value.account.siteName ?? ''));
              final siteUrl = ref.watch(accountAddViewModelProvider.select((value) => value.account.siteUrl ?? ''));
              final userId = ref.watch(accountAddViewModelProvider.select((value) => value.account.userId ?? ''));
              final userName = ref.watch(accountAddViewModelProvider.select((value) => value.account.userName ?? ''));
              return Center(
                child: Text('${siteName}\n${siteUrl}\n${userId}\n${userName}'),
              );
            }),
            const Text('-----------------'),
            AccountUserInputWidget(
              decoration: const InputDecoration(
                labelText: 'User ID',
                hintText: 'User ID',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                accountNotifier.updateAccount(
                  userId: value,
                );
                DebugLog.d('AccountUserIdWidget onChanged: $value');
              },
              onSubmitted: (value) {
                DebugLog.i('AccountUserIdWidget onSubmitted: $value');
              },
              onTapOutside: (_) {
                DebugLog.d('AccountUserIdWidget Tap outside');
                FocusManager.instance.primaryFocus?.unfocus();
              },
            ),
            const SizedBox(height: 16),
            AccountUserInputWidget(
              decoration: InputDecoration(
                labelText: 'Site Name',
                hintText: PlatformUtil.isIOS() ? 'Apple' : 'Google',
              ),
              onChanged: (value) {
                accountNotifier.updateAccount(
                  siteName: value,
                );
                DebugLog.d('AccountUserIdWidget onChanged: $value');
              },
              onSubmitted: (value) {
                DebugLog.i('AccountUserIdWidget onSubmitted: $value');
              },
              onTapOutside: (_) {
                DebugLog.d('AccountUserIdWidget Tap outside');
                FocusManager.instance.primaryFocus?.unfocus();
              },
            ),
            const SizedBox(height: 16),
            AccountUserInputWidget(
              decoration: InputDecoration(
                labelText: 'Site URL',
                hintText: PlatformUtil.isIOS()
                    ? 'https://apple.com'
                    : 'https://google.com',
              ),
              onChanged: (value) {
                accountNotifier.updateAccount(
                  siteUrl: value,
                );
                DebugLog.d('AccountUserIdWidget onChanged: $value');
              },
              onSubmitted: (value) {
                DebugLog.i('AccountUserIdWidget onSubmitted: $value');
              },
              onTapOutside: (_) {
                DebugLog.d('AccountUserIdWidget Tap outside');
                FocusManager.instance.primaryFocus?.unfocus();
              },
            ),
            const SizedBox(height: 16),
            AccountUserInputWidget(
              decoration: const InputDecoration(
                labelText: 'User Name',
                hintText: 'User Name',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                accountNotifier.updateAccount(
                  userName: value,
                );
                DebugLog.d('AccountUserIdWidget onChanged: $value');
              },
              onSubmitted: (value) {
                DebugLog.i('AccountUserIdWidget onSubmitted: $value');
              },
              onTapOutside: (_) {
                DebugLog.d('AccountUserIdWidget Tap outside');
                FocusManager.instance.primaryFocus?.unfocus();
              },
            ),
            ElevatedButton(onPressed: () {
              accountNotifier.saveAccount();
              Navigator.pop(context);
            }, child: const Text('Save')),
          ],
        ),
      ),
    );
  }
}
