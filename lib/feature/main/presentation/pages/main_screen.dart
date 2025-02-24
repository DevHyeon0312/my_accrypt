import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_accrypt/app/route/app_route.dart';
import 'package:my_accrypt/common/base/base_scaffold.dart';
import 'package:my_accrypt/common/utils/debug_log.dart';
import 'package:my_accrypt/feature/accrypt/presentation/pages/account_list_page.dart';
import 'package:my_accrypt/feature/main/presentation/pages/search_page.dart';

import '../viewmodels/bottom_nav_viewmodel.dart';
import 'settings_page.dart';

/// Main
class MainScreen extends HookConsumerWidget {
  const MainScreen({super.key});

  void listener(context, notifier, previous, next) {
    if (next == 3) {
      notifier.onItemTapped(previous ?? 0);
      Navigator.pushNamed(context, AppRoute.debug.name);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomNavIndex = ref.watch(bottomNavViewModelProvider.select((selector) => selector));
    final notifier = ref.read(bottomNavViewModelProvider.notifier);

    ref.listen(bottomNavViewModelProvider, (previous, next) {
      DebugLog.d('main_screen: build - bottomNavViewModelProvider listen');
      listener(context, notifier, previous, next);
    });

    return BaseScaffold(
      canPop: false,
      onPopInvokedWithResult: (a, b) {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        } else {
          DebugLog.d(
              'main_screen: onPopInvokedWithResult - Navigator.canPop(context) is false');
        }
      },
      body: SafeArea(
        child: IndexedStack(
          index: bottomNavIndex,
          children: const [
            AccountListPage(),
            SearchPage(),
            SettingsPage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomNavIndex,
        onTap: notifier.onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_tree_outlined),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          // if (kDebugMode)
          //   BottomNavigationBarItem(
          //     icon: Icon(Icons.bug_report_outlined),
          //     label: 'Debug Tools',
          //   ),
        ],
      ),
    );
  }
}
