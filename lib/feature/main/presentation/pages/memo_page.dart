import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MemoPage extends HookConsumerWidget {
  const MemoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController(); // ✅ Hooks 사용
    return Scaffold(
      appBar: AppBar(title: const Text('Memo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
          ],
        ),
      ),
    );
  }
}