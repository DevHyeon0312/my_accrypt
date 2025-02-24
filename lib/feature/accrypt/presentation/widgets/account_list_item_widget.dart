import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_accrypt/common/utils/debug_log.dart';
import 'package:my_accrypt/feature/accrypt/presentation/ui_models/account_ui_model.dart';

class AccountListItemWidget extends HookConsumerWidget {
  final AccountUiModel accountUiModel;
  final VoidCallback onClickItem;

  const AccountListItemWidget({
    super.key,
    required this.accountUiModel,
    required this.onClickItem,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: onClickItem,
      onLongPress: () {
        showDialog(context: context, builder: (context) {
          return AlertDialog(
            title: const Text('경고'),
            content: const Text('삭제하시겠습니까?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('취소'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('삭제'),
              ),
            ],
          );
        }).then((value) {
          if (value == true) {
            // ref.read(accountListViewModelProvider.notifier).deleteAccount(accountUiModel.uuid);
          }
        });
      },
      borderRadius: BorderRadius.circular(16),
      highlightColor: Colors.blue.withOpacity(0.1),
      child: Card(
        child: Padding(padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              // 32 x 32 Circle Icon
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    'ID/PW',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Text(
                accountUiModel.siteName ?? '',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
