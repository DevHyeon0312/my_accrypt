import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final bottomNavViewModelProvider = StateNotifierProvider<BottomNavViewModel, int>((ref) {
  return BottomNavViewModel();
});

class BottomNavViewModel extends StateNotifier<int> {
  BottomNavViewModel() : super(0);

  void onItemTapped(int index) {
    state = index;
  }
}