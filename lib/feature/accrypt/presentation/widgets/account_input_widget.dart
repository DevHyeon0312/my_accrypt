import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AccountInputWidget extends HookConsumerWidget {
  const AccountInputWidget({
    required this.isRequired,
    required this.title,
    required this.decoration,
    required this.onChanged,
    required this.onSubmitted,
    required this.onTapOutside,
    super.key,
  });

  final bool isRequired;
  final String title;
  final InputDecoration decoration;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TapRegionCallback? onTapOutside;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController controller = useTextEditingController();
    final FocusNode focusNode = useFocusNode();

    /// 포커스가 되었을 때, 테두리 색상을 변경
    useListenable(focusNode);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: focusNode.hasFocus ? Colors.blue : Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: focusNode.requestFocus,
            behavior: HitTestBehavior.translucent,
            child: Container(
              padding:
                  const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 0),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: isRequired ? '* ' : '',
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        height: 1,
                      ),
                    ),
                    TextSpan(
                      text: title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ),
              alignment: Alignment.bottomLeft,
            ),
          ),
          TextField(
            controller: controller,
            focusNode: focusNode,
            decoration: decoration.copyWith(
              isDense: true,
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),
              border: InputBorder.none,
              // decoration.border ?? const OutlineInputBorder(),
              contentPadding:
                  const EdgeInsets.only(left: 8, right: 8, bottom: 4, top: 4),
            ),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            onSubmitted: onSubmitted,
            onChanged: onChanged,
            onTapOutside: onTapOutside,
          ),
        ],
      ),
    );
  }
}
