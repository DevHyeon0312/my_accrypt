import 'package:flutter/material.dart';
import 'package:my_accrypt/app/route/app_route.dart';
import 'package:my_accrypt/feature/accrypt/presentation/pages/account_add_page.dart';
import 'package:my_accrypt/feature/debug/presentation/pages/debug_page.dart';
import 'package:my_accrypt/feature/main/presentation/pages/main_screen.dart';

class AppNavigator {
  /// 전역적으로 사용할 Navigator Key
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// 라우트 생성 함수 (onGenerateRoute에 연결됨)
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    var appRoute = AppRoute.findRouteByName(settings.name ?? '');
    switch (appRoute) {
      case AppRoute.main:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case AppRoute.debug:
        return MaterialPageRoute(builder: (_) => const DebugPage());
      case AppRoute.accountAdd:
        return MaterialPageRoute(builder: (_) => const AccountAddPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
