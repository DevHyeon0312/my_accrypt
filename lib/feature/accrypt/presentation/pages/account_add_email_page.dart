import 'package:flutter/material.dart';
import 'package:flutter_sliding_toast/flutter_sliding_toast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_accrypt/common/base/base_scaffold.dart';
import 'package:my_accrypt/common/utils/debug_log.dart';
import 'package:my_accrypt/common/utils/platform_util.dart';
import 'package:my_accrypt/common/utils/safety_navigator.dart';
import 'package:my_accrypt/feature/accrypt/domain/enums/account_type.dart';
import 'package:my_accrypt/feature/accrypt/presentation/widgets/account_input_widget.dart';
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
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Consumer(builder: (context, ref, child) {
                    final isProgress = ref.watch(accountAddViewModelProvider
                        .select((value) => value.isProgressVisible));
                    return AccountInputWidget(
                      isEnabled: !isProgress,
                      isRequired: true,
                      title: 'Site Name',
                      decoration: InputDecoration(
                        hintText: PlatformUtil.isIOS() ? 'Apple' : 'Google',
                        hintStyle: const TextStyle(color: Colors.grey),
                      ),
                      onChanged: (String value) {
                        accountNotifier.updateAccount(siteName: value);
                      },
                      onSubmitted: (String value) {},
                      onTapOutside: (PointerDownEvent event) {},
                    );
                  }),
                  const SizedBox(height: 16),
                  Consumer(builder: (context, ref, child) {
                    final isProgress = ref.watch(accountAddViewModelProvider
                        .select((value) => value.isProgressVisible));
                    return AccountInputWidget(
                      isEnabled: !isProgress,
                      isRequired: true,
                      title: 'Email',
                      decoration: const InputDecoration(
                        hintText: 'abc@test.com',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      onChanged: (String value) {
                        accountNotifier.updateAccount(userId: value);
                      },
                      onSubmitted: (String value) {},
                      onTapOutside: (PointerDownEvent event) {},
                    );
                  }),
                  const SizedBox(height: 16),
                  Consumer(builder: (context, ref, child) {
                    final isProgress = ref.watch(accountAddViewModelProvider
                        .select((value) => value.isProgressVisible));
                    return AccountInputWidget(
                      isEnabled: !isProgress,
                      isRequired: true,
                      title: 'Password',
                      decoration: const InputDecoration(
                        hintText: 'abc123!@#',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      onChanged: (String value) {
                        accountNotifier.updateAccount(userPassword: value);
                      },
                      onSubmitted: (String value) {},
                      onTapOutside: (PointerDownEvent event) {},
                    );
                  }),
                  const SizedBox(height: 16),
                  Consumer(builder: (context, ref, child) {
                    final isProgress = ref.watch(accountAddViewModelProvider
                        .select((value) => value.isProgressVisible));
                    return AccountInputWidget(
                      isEnabled: !isProgress,
                      isRequired: false,
                      title: 'User Name',
                      decoration: const InputDecoration(
                        hintText: 'DevHyeon',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      onChanged: (String value) {
                        accountNotifier.updateAccount(groupName: value);
                      },
                      onSubmitted: (String value) {},
                      onTapOutside: (PointerDownEvent event) {},
                    );
                  }),
                  const SizedBox(height: 16),
                  Consumer(builder: (context, ref, child) {
                    final isProgress = ref.watch(accountAddViewModelProvider
                        .select((value) => value.isProgressVisible));
                    return AccountInputWidget(
                      isEnabled: !isProgress,
                      isRequired: false,
                      title: 'PhoneNumber',
                      decoration: const InputDecoration(
                        hintText: '010-0000-0000',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      onChanged: (String value) {
                        accountNotifier.updateAccount(userPhone: value);
                      },
                      onSubmitted: (String value) {},
                      onTapOutside: (PointerDownEvent event) {},
                    );
                  }),
                  const SizedBox(height: 16),
                  Consumer(builder: (context, ref, child) {
                    final isProgress = ref.watch(accountAddViewModelProvider
                        .select((value) => value.isProgressVisible));
                    return AccountInputWidget(
                      isEnabled: !isProgress,
                      isRequired: false,
                      title: 'Site URL',
                      decoration: const InputDecoration(
                        hintText: 'https://apple.com',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      onChanged: (String value) {
                        accountNotifier.updateAccount(siteUrl: value);
                      },
                      onSubmitted: (String value) {},
                      onTapOutside: (PointerDownEvent event) {},
                    );
                  }),
                  const SizedBox(height: 16),
                  Consumer(builder: (context, ref, child) {
                    final isProgress = ref.watch(accountAddViewModelProvider
                        .select((value) => value.isProgressVisible));
                    return AccountInputWidget(
                      isEnabled: !isProgress,
                      isRequired: false,
                      title: 'Note',
                      decoration: const InputDecoration(
                        hintText: 'Free Note',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      onChanged: (String value) {
                        accountNotifier.updateAccount(note: value);
                      },
                      onSubmitted: (String value) {},
                      onTapOutside: (PointerDownEvent event) {},
                    );
                  }),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          Consumer(builder: (context, ref, child) {
            final isProgress = ref.watch(accountAddViewModelProvider
                .select((value) => value.isProgressVisible));
            if (isProgress) {
              return Container(
                  color: Colors.white.withOpacity(0.5),
                  width: double.infinity,
                  height: double.infinity,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ));
            } else {
              return const SizedBox.shrink();
            }
          }),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 12,
            top: 12,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0, -1),
                blurRadius: 4,
              ),
            ],
          ),
          child: Consumer(builder: (context, ref, child) {
            final isProgress = ref.watch(accountAddViewModelProvider
                .select((value) => value.isProgressVisible));
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                disabledBackgroundColor: Colors.blue,
                disabledForegroundColor: Colors.white.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: isProgress
                  ? null
                  : () async {
                var result = await accountNotifier.saveAccount(AccountType.email);
                if (result) {
                  // ignore: use_build_context_synchronously (SafetyNavigator 사용)
                  SafetyNavigator.pop(context);
                } else if (context.mounted) {
                  InteractiveToast.closeAllToast();
                  InteractiveToast.pop(
                    context,
                    title: const Text(
                      '저장에 실패했습니다.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    leading: const Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                    toastSetting: const PopupToastSetting(
                      animationDuration: Duration(seconds: 1),
                      displayDuration: Duration(seconds: 1),
                      toastAlignment: Alignment.bottomCenter,
                      showFading: false,
                    ),
                    toastStyle: ToastStyle(
                      backgroundColor: Colors.white,
                      borderRadius:
                      const BorderRadius.all(Radius.circular(16)),
                      // ✅ 둥근 모서리 적용
                      border: Border.all(
                        color: Colors.red,
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red.withOpacity(0.3),
                          blurRadius: 0,
                          spreadRadius: -10,
                          blurStyle: BlurStyle.outer,
                        ),
                      ],
                    ),
                  );
                }
              },
              child: const Text('Save'),
            );
          }),
        ),
      ),
    );
  }
}
