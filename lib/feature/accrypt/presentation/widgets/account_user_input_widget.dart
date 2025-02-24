import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AccountUserInputWidget extends HookConsumerWidget {
  const AccountUserInputWidget({
    super.key,
    this.isRequired = false,
    required this.decoration,
    required this.onChanged,
    required this.onSubmitted,
    required this.onTapOutside,
  });

  final bool isRequired;
  final InputDecoration decoration;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TapRegionCallback? onTapOutside;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController controller = useTextEditingController();
    final FocusNode focusNode = useFocusNode();

    return Stack(
      children: [
        isRequired
            ? const Text(
                '*',
                textScaler: TextScaler.noScaling,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                ),
              )
            : const SizedBox.shrink(),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            decoration: decoration.copyWith(
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),
              border: decoration.border ?? const OutlineInputBorder(),
            ),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            onSubmitted: onSubmitted,
            onChanged: onChanged,
            onTapOutside: onTapOutside,
          ),
        ),
      ],
    );
  }
}
