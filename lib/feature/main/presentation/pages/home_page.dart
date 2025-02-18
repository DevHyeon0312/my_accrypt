import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_accrypt/app/route/app_route.dart';
import '../../../../di.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountListViewmodel = ref.watch(accountListViewmodelProvider.notifier);
    accountListViewmodel.getAccountList();
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text(
          '🏠 Home Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoute.accountAdd.name);
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
