import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_accrypt/common/base/base_scaffold.dart';
import 'package:my_accrypt/common/utils/safety_navigator.dart';
import 'package:my_accrypt/feature/accrypt/presentation/widgets/account_viewer_widget.dart';
import 'package:my_accrypt/provider/viewmodel_providers.dart';

class AccountDetailPage extends HookConsumerWidget {
  const AccountDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = SafetyNavigator.getArgs(context);
    final notifier = ref.watch(accountDetailViewModelProvider(args).notifier);

    return BaseScaffold(
      appBar: AppBar(
        title: const Text('Account Detail Page'),
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
        scrolledUnderElevation: 0,
      ),
      body: Stack(
        children: [
          Consumer(builder: (context, ref, child) {
            var accountUiModel = ref.watch(accountDetailViewModelProvider(args)
                .select((value) => value.accountUiModel));
            if (accountUiModel == null) {
              return const SizedBox.shrink();
            } else {
              return SingleChildScrollView(
                child: AccountViewerWidget(
                  accountUiModel: accountUiModel,
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.all(16),
                ),
              );
            }
          }),
          Consumer(builder: (context, ref, child) {
            final isProgress = ref.watch(accountDetailViewModelProvider(args)
                .select((value) => value.isProgressVisible));

            if (isProgress) {
              return Container(
                color: Colors.white.withOpacity(0.5),
                width: double.infinity,
                height: double.infinity,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          }),
        ],
      ),
    );
  }
}
