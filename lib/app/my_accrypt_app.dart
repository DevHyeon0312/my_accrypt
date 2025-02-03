import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_accrypt/app/route/app_navigator.dart';
import 'package:my_accrypt/app/viewmodels/app_config_viewmodel.dart';
import 'package:my_accrypt/feature/main/presentation/pages/settings_page.dart';

import 'route/app_route.dart';

class MyAccryptApp extends ConsumerWidget {
  const MyAccryptApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appViewModel = ref.watch(appViewModelProvider);
    final isDarkMode = appViewModel.isDarkMode;
    final isDebugShowPerformanceOverlay =
        appViewModel.isDebugShowPerformanceOverlay;
    final isDebugShowSemanticsDebugger =
        appViewModel.isDebugShowSemanticsDebugger;
    final isDebugShowCheckedModeBanner =
        appViewModel.isDebugShowCheckedModeBanner;
    final isDebugShowMaterialGrid = appViewModel.isDebugShowMaterialGrid;

    return MaterialApp(
      showPerformanceOverlay: isDebugShowPerformanceOverlay,
      showSemanticsDebugger: isDebugShowSemanticsDebugger,
      debugShowCheckedModeBanner: isDebugShowCheckedModeBanner,
      debugShowMaterialGrid: isDebugShowMaterialGrid,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          enableFeedback: false,
        ),
        colorScheme: const ColorScheme.light(
          primary: Colors.blueAccent,
          primaryContainer: Colors.blueAccent,
          onPrimary: Colors.white,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: const ColorScheme.dark(
          primary: Colors.white,
        ),
        useMaterial3: true,
      ),
      navigatorKey: AppNavigator.navigatorKey,
      onGenerateRoute: AppNavigator.onGenerateRoute,
      initialRoute: AppRoute.main.name,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.noScaling,
          ),
          child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness:
                  isDarkMode ? Brightness.light : Brightness.dark,
              statusBarBrightness:
                  isDarkMode ? Brightness.dark : Brightness.light,
              systemNavigationBarColor:
                  isDarkMode ? Colors.black : Colors.white,
              systemNavigationBarIconBrightness:
                  isDarkMode ? Brightness.light : Brightness.dark,
            ),
            child: Scaffold(
              body: child,
              endDrawer: SettingsPage(),
            )
          ),
        );
      },
    );
  }
}
