import 'package:flutter/material.dart';
import 'package:my_accrypt/app/route/app_route.dart';
import 'package:my_accrypt/common/utils/debug_log.dart';
import 'package:my_accrypt/common/utils/safety_navigator.dart';

class CustomFabLocation extends FloatingActionButtonLocation {
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

/// TODO _AnimatedFabButton 을 public 으로 변경하고, CustomFloatingActionButton 에서 List<AnimatedFabButton> 으로 변경 후 사용
class CustomFloatingActionButton extends StatefulWidget {
  const CustomFloatingActionButton({super.key});

  @override
  State<CustomFloatingActionButton> createState() =>
      _CustomFloatingActionButtonState();
}

class _CustomFloatingActionButtonState extends State<CustomFloatingActionButton>
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
            await _animationController.forward().orCancel;
          }
        } else {
          if (_animationController.status != AnimationStatus.reverse &&
              _animationController.value > 0.0) {
            await _animationController.reverse().orCancel;
          }
        }
      } on TickerCanceled {
        // 애니메이션이 취소된 경우 예외 처리
        DebugLog.e('TickerCanceled : 애니메이션이 취소된 경우 예외 처리');
      }
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
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
          _AnimatedFabButton(
            controller: _animationController,
            index: 3,
            icon: Icons.perm_identity_outlined,
            label: 'ID/PW',
            onPressed: () {
              _toggleFab();
              SafetyNavigator.pushNamed(context, AppRoute.accountAddIdPwType.name);
            },
          ),
        if (_isExpanded)
          _AnimatedFabButton(
            controller: _animationController,
            index: 2,
            icon: Icons.email_outlined,
            label: 'E-mail',
            onPressed: () {
              _toggleFab();
              SafetyNavigator.pushNamed(context, AppRoute.accountAddEmailType.name);
            }
          ),
        if (_isExpanded)
          _AnimatedFabButton(
            controller: _animationController,
            index: 1,
            icon: Icons.public_outlined,
            label: 'Social',
            onPressed: () => _showSnackBar(context, '계정 삭제 클릭됨'),
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
    );
  }
}

class _AnimatedFabButton extends StatelessWidget {
  final AnimationController controller;
  final int index;
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const _AnimatedFabButton({
    required this.controller,
    required this.index,
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
        curve: Interval(
          0.1 * index,
          1.0,
          curve: Curves.easeOut,
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(right: 16.0, bottom: 16.0),
      child: SlideTransition(
        position: offsetAnimation,
        child: Padding(
          padding: EdgeInsets.only(bottom: 70.0 * index),
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
      ),
    );
  }
}
