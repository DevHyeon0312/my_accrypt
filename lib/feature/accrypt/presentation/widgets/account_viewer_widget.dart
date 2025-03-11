import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_accrypt/common/utils/date_util.dart';
import 'package:my_accrypt/common/utils/primitive_type_util.dart';
import 'package:my_accrypt/feature/accrypt/presentation/ui_models/account_ui_model.dart';

class AccountViewerWidget extends ConsumerWidget {
  final AccountUiModel accountUiModel;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const AccountViewerWidget({
    super.key,
    required this.accountUiModel,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _AccountDetailRow(title: 'Site Name', value: accountUiModel.siteName),
          _AccountDetailRow(title: 'Site URL', value: accountUiModel.siteUrl),
          _AccountDetailRow(
              title: 'LoginType',
              value: accountUiModel.accountType.name.toUpperCase()),
          _AccountDetailRow(
              title: 'ID',
              value: accountUiModel.userId,
              onTap: () {
                if (accountUiModel.userId?.isNotEmpty == true) {
                  Clipboard.setData(
                      ClipboardData(text: accountUiModel.userId!));
                }
              }),
          _AccountDetailRow(
              title: 'PW',
              value: accountUiModel.userPassword ?? 'N/A',
              onTap: () {
                if (accountUiModel.userPassword?.isNotEmpty == true) {
                  Clipboard.setData(
                      ClipboardData(text: accountUiModel.userPassword!));
                }
              }),
          _AccountDetailRow(title: 'Note', value: accountUiModel.note),
          _AccountDetailRow(title: 'Name', value: accountUiModel.userName),
          _AccountDetailRow(title: 'Phone', value: accountUiModel.userPhone),
          _AccountDetailRow(
              title: 'Created At',
              value: DateUtil.getFormattedDateStr(accountUiModel.createdAt)),
          _AccountDetailRow(
              title: 'Updated At',
              value: DateUtil.getFormattedDateStr(accountUiModel.updatedAt)),
        ],
      ),
    );
  }
}

class _AccountDetailRow extends StatelessWidget {
  const _AccountDetailRow({required this.title, required this.value, this.onTap});

  final String title;
  final String? value;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 110,
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        value?.isNotEmpty == true && value != null
                            ? value!
                            : 'N/A',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                        maxLines: onTap == null ? PrimitiveTypeUtil.intMax : 5,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 2),
                    if (onTap != null)
                      const Icon(
                        Icons.copy,
                        size: 14,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
