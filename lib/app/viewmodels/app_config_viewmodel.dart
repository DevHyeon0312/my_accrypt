
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/models/app_config_model.dart';

final appViewModelProvider = StateNotifierProvider<AppViewModel, AppConfigModel>((ref) {
  return AppViewModel(AppConfigModel());
});

class AppViewModel extends StateNotifier<AppConfigModel> {
  AppViewModel(super.state);

  void toggleDarkMode(bool value) {
    state = state.copyWith(isDarkMode: value);
  }

  void toggleDebugShowPerformanceOverlay(bool value) {
    state = state.copyWith(isDebugShowPerformanceOverlay: value);
  }

  void toggleDebugShowSemanticsDebugger(bool value) {
    state = state.copyWith(isDebugShowSemanticsDebugger: value);
  }

  void toggleDebugShowCheckedModeBanner(bool value) {
    state = state.copyWith(isDebugShowCheckedModeBanner: value);
  }

  void toggleDebugShowMaterialGrid(bool value) {
    state = state.copyWith(isDebugShowMaterialGrid: value);
  }
}