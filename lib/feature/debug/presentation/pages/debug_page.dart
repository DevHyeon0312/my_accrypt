import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_accrypt/common/base/base_scaffold.dart';

import '../../../../app/viewmodels/app_config_viewmodel.dart';

class DebugPage extends ConsumerWidget {
  const DebugPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appViewModel = ref.watch(appViewModelProvider);
    final notifier = ref.read(appViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Debug Page'),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text('Dark Mode'),
            trailing: Switch(
              value: appViewModel.isDarkMode,
              onChanged: (value) => notifier.toggleDarkMode(value),
            ),
          ),
          if (kDebugMode)
            ListTile(
              title: const Text('Debug: Show Performance Overlay'),
              trailing: Switch(
                value: appViewModel.isDebugShowPerformanceOverlay,
                onChanged: (value) => notifier.toggleDebugShowPerformanceOverlay(value),
              ),
            ),
          if (kDebugMode)
            ListTile(
              title: const Text('Debug: Show Semantics Debugger'),
              trailing: Switch(
                value: appViewModel.isDebugShowSemanticsDebugger,
                onChanged: (value) => notifier.toggleDebugShowSemanticsDebugger(value),
              ),
            ),
          if (kDebugMode)
            ListTile(
              title: const Text('Debug: Show Checked Mode Banner'),
              trailing: Switch(
                value: appViewModel.isDebugShowCheckedModeBanner,
                onChanged: (value) => notifier.toggleDebugShowCheckedModeBanner(value),
              ),
            ),
          if (kDebugMode)
            ListTile(
              title: const Text('Debug: Show Material Grid'),
              trailing: Switch(
                value: appViewModel.isDebugShowMaterialGrid,
                onChanged: (value) => notifier.toggleDebugShowMaterialGrid(value),
              ),
            ),

          const SizedBox(height: 20),
          const Center(
            child: Text('⚙️ Settings Page', style: TextStyle(fontSize: 24)),
          ),
          ElevatedButton(onPressed: () {}, child: Text('Sign Out')),
        ],
      ),
    );
  }
}
