import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_accrypt/common/base/base_scaffold.dart';
import 'package:my_accrypt/common/utils/debug_log.dart';
import 'package:my_accrypt/common/widget/custom_floating_action_button/custom_floating_action_button.dart';

import '../../../../di.dart';

class AccountListPage extends HookConsumerWidget {
  const AccountListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(accountListViewmodelProvider.notifier);
    final isProgressVisible = ref.watch(
        accountListViewmodelProvider.select((value) => value
            .isProgressVisible));
    final accountList = ref.watch(
        accountListViewmodelProvider.select((value) => value.accountList));
    final searchController = useTextEditingController();
    final scrollController = useScrollController();

    final accountLocalStream = ref.read(
        accountLocalDataSourceProvider.select((value) => value.onChange));
    useEffect(() {
      final subscription = accountLocalStream.listen((event) {
        DebugLog.i('AccountListPage >> accountLocalStream: db data 변경');
        notifier.getAccountList();
      });
      return subscription.cancel; // 위젯이 dispose될 때 리스너 해제
    }, [accountLocalStream]);

    return BaseScaffold(
      canPop: false,
      onPopInvokedWithResult: (a, b) {
        if (Navigator.canPop(context)) {

        }
      },
      appBar: null,
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            title: SearchBar(
              controller: searchController,
              leading: const Icon(Icons.search),
              padding: WidgetStateProperty.all(
                  const EdgeInsets.only(left: 16,)
              ),
              hintText: 'Search...',
              trailing: [
                IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    searchController.clear();
                  },
                ),
              ],
              onTap: () {
                print('Search: ${searchController.text}');
              },
              onChanged: (value) {
                print('Search: $value');
              },
              onTapOutside: (_) {
                print('Tap outside');
              },
              onSubmitted: (value) {
                print('Submitted: $value');
              },
            ),
            titleSpacing: 8,
            toolbarHeight: 80,
            floating: false,
            snap: false,
            pinned: true,
            scrolledUnderElevation: 0,
          ),
          if (isProgressVisible)
            const SliverFillRemaining(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          if (!isProgressVisible && accountList.isEmpty)
            const SliverFillRemaining(
              child: Center(
                child: Text('No data'),
              ),
            ),
          if (!isProgressVisible && accountList.isNotEmpty)
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return ListTile(
                    title: Text('Item ${accountList[index].userId}'),
                  );
                },
                childCount: accountList.length,
              ),
            ),
        ],
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.e,
      floatingActionButtonLocation: CustomFabLocation(),
      floatingActionButton: const CustomFloatingActionButton(),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}