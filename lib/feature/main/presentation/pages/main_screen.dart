import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_accrypt/app/route/app_route.dart';
import 'package:my_accrypt/common/base/base_scaffold.dart';
import 'package:my_accrypt/common/utils/debug_log.dart';

import '../viewmodels/bottom_nav_viewmodel.dart';
import 'home_page.dart';
import 'search_page.dart';
import 'settings_page.dart';

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
    final bottomNavIndex = ref.watch(bottomNavViewModelProvider);
    final notifier = ref.read(bottomNavViewModelProvider.notifier);

    ref.listen(bottomNavViewModelProvider, (previous, next) {
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
            HomePage(),
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
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          if (kDebugMode)
            BottomNavigationBarItem(
              icon: Icon(Icons.bug_report_outlined),
              label: 'Debug Tools',
            ),
        ],
      ),
    );
  }
}
