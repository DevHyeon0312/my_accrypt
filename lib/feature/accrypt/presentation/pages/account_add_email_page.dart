import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_accrypt/app/route/app_route.dart';
import 'package:my_accrypt/common/base/base_scaffold.dart';
import 'package:my_accrypt/common/utils/debug_log.dart';
import 'package:my_accrypt/common/utils/platform_util.dart';
import 'package:my_accrypt/common/utils/safety_navigator.dart';
import 'package:my_accrypt/feature/accrypt/presentation/widgets/account_user_input_widget.dart';
import 'package:my_accrypt/provider/viewmodel_providers.dart';

class AccountEmailPage extends HookConsumerWidget {
  const AccountEmailPage({super.key});

  Future<bool> _showExitConfirmation(BuildContext context, bool hasData) async {
    if (!hasData) {
      return true;
    }
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('경고'),
        content: const Text('지금 나가면 입력한 내용이 사라집니다. 그래도 나가시겠습니까?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('취소'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('나가기'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// accountAddViewModelProvider 은 autoDispose 로 생성되었기 때문에
    /// 여기서 ref.read 를 하게 되면, 하위 위젯에서 watch 를 하지 않으면 accountAddViewModelProvider 가 dispose 될 수 있음
    /// 그래서 watch 를 사용하여 accountAddViewModelProvider 를 계속 유지하도록 함
    final accountNotifier = ref.watch(accountAddViewModelProvider.notifier);

    return BaseScaffold(
      onPopInvokedWithResult: (a, b) async {
        if (context.mounted && Navigator.canPop(context)) {
          bool hasData = accountNotifier.hasData();
          bool shouldPop = await _showExitConfirmation(context, hasData)
              .onError((error, stackTrace) {
            DebugLog.e('AccountEmailPage _showExitConfirmation error: $error');
            return false;
          });
          if (shouldPop) {
            // ignore: use_build_context_synchronously (SafetyNavigator 사용)
            SafetyNavigator.pop(context);
          }
        }
      },
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
        scrolledUnderElevation: 0,
      ),
      body: Container(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: GridView.custom(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 4,
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    childrenDelegate:
                        SliverChildBuilderDelegate((context, index) {
                      return Text(
                        '${index + 1} 테스트',
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).primaryColor,
                        ),
                      );
                    }, childCount: 10,),),
              ),
            ],
          )),
    );
  }
}
