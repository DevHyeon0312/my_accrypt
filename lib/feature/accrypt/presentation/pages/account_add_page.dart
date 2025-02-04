import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_accrypt/app/route/app_route.dart';
import 'package:my_accrypt/common/base/base_scaffold.dart';
import 'package:my_accrypt/app/viewmodels/app_config_viewmodel.dart';

class AccountAddPage extends ConsumerWidget {
  const AccountAddPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appViewModel = ref.watch(appViewModelProvider);
    final notifier = ref.read(appViewModelProvider.notifier);
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
        child: Text('Account Add Page'),
      )
    );
  }
}