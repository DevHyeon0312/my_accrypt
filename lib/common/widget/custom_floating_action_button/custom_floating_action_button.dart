import 'package:flutter/material.dart';
import 'package:my_accrypt/common/utils/debug_log.dart';

class CustomFloatingActionButton {
  static FloatingActionButtonLocation customFabLocation() {
    return _CustomFabLocation();
  }

  static Widget customFloatingActionButton({
    Key? key,
    required List<CustomFabItem> fabItems,
  }) {
    return _CustomFabButton(key: key, fabItems: fabItems);
  }
}

class CustomFabItem {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const CustomFabItem({
    required this.icon,
    required this.label,
    required this.onPressed,
  });
}

class _CustomFabLocation extends FloatingActionButtonLocation {
  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    return Offset(
      scaffoldGeometry.scaffoldSize.width -
          scaffoldGeometry.floatingActionButtonSize.width,
      scaffoldGeometry.scaffoldSize.height -
          scaffoldGeometry.floatingActionButtonSize.height,
    );
  }
}

class _CustomFabButton extends StatefulWidget {
  const _CustomFabButton({super.key, required this.fabItems});

  final List<CustomFabItem> fabItems;

  @override
  State<_CustomFabButton> createState() => _CustomFabButtonState();
}

class _CustomFabButtonState extends State<_CustomFabButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleFab() async {
    if (mounted) {
      setState(() {
        _isExpanded = !_isExpanded;
      });
      try {
        if (_isExpanded) {
          if (_animationController.status != AnimationStatus.forward) {
            await _animationController.forward().orCancel.catchError((e) {
              DebugLog.e('애니메이션 에러 : $e');
            });
          }
        } else {
          if (_animationController.status != AnimationStatus.reverse &&
              _animationController.value > 0.0) {
            await _animationController.reverse().orCancel.catchError((e) {
              DebugLog.e('애니메이션 에러 : $e');
            });
          }
        }
      } on TickerCanceled {
        // 애니메이션이 취소된 경우 예외 처리
        DebugLog.e('TickerCanceled : 애니메이션이 취소된 경우 예외 처리');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_isExpanded) {
          DebugLog.d('🔥 PopScope: 뒤로가기 키 감지됨 - FAB 닫기');
          _toggleFab();
          return false;
        }
        return true;
      },
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          if (_isExpanded)
            GestureDetector(
              onTap: _toggleFab, // 오버레이 클릭 시 FAB 닫힘
              child: Container(
                color: Colors.white.withOpacity(0.8), // 반투명 효과
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          if (_isExpanded)
            Positioned(
              bottom: 70,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (final item in widget.fabItems.asMap().entries)
                    _AnimatedFabButton(
                      controller: _animationController,
                      icon: item.value.icon,
                      label: item.value.label,
                      onPressed: () {
                        _toggleFab();
                        item.value.onPressed();
                      },
                    ),
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, bottom: 16.0),
            child: ScaleTransition(
              scale: Tween<double>(begin: 1, end: 0.8).animate(
                CurvedAnimation(
                    parent: _animationController, curve: Curves.easeInOut),
              ),
              child: RotationTransition(
                turns: Tween<double>(begin: 0.0, end: 0.5).animate(
                  CurvedAnimation(
                      parent: _animationController, curve: Curves.easeInOut),
                ),
                child: FloatingActionButton(
                  onPressed: _toggleFab,
                  child: Icon(
                    _isExpanded ? Icons.close : Icons.add,
                    key: ValueKey<bool>(_isExpanded),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AnimatedFabButton extends StatelessWidget {
  final AnimationController controller;
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const _AnimatedFabButton({
    super.key,
    required this.controller,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0,
          1.0,
          curve: Curves.easeOut,
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(right: 16.0, bottom: 16.0),
      child: SlideTransition(
        position: offsetAnimation,
        child: FadeTransition(
          opacity: controller,
          child: FloatingActionButton.extended(
            heroTag: label,
            onPressed: onPressed,
            icon: Icon(icon),
            label: SizedBox(
              width: 50,
              child: Text(label),
            ),
          ),
        ),
      ),
    );
  }
}
