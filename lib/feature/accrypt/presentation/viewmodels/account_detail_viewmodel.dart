import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_accrypt/common/utils/debug_log.dart';
import 'package:my_accrypt/feature/accrypt/domain/usecases/account_use_case.dart';
import 'package:my_accrypt/feature/accrypt/presentation/ui_models/account_ui_model.dart';

class AccountDetailViewModel
    extends StateNotifier<AccountDetailViewModelState> {
  final AccountUseCase _accountUseCase;
  final Map<String, dynamic> _args;

  AccountDetailViewModel(
    this._accountUseCase,
    this._args,
  ) : super(AccountDetailViewModelState(
            isProgressVisible: false, accountUiModel: null)) {
    initData();
  }

  void initData() async {
    state = state.copyWith(isProgressVisible: true);
    final uuid = _args['uuid'] as String? ?? '';
    _accountUseCase.getAccount(uuid: uuid).then((value) {
      DebugLog.i('value: $value');
      state = state.copyWith(
        isProgressVisible: false,
        accountUiModel: value,
      );
    }).onError((error, stackTrace) {
      DebugLog.e('error: $error');
      state = state.copyWith(isProgressVisible: false);
    });
  }

  @override
  void dispose() {
    DebugLog.d('AccountDetailViewModel dispose');
    super.dispose();
  }
}

class AccountDetailViewModelState {
  bool isProgressVisible;
  AccountUiModel? accountUiModel;

  AccountDetailViewModelState({
    required this.isProgressVisible,
    required this.accountUiModel,
  });

  AccountDetailViewModelState copyWith({
    bool? isProgressVisible,
    AccountUiModel? accountUiModel,
  }) {
    return AccountDetailViewModelState(
      isProgressVisible: isProgressVisible ?? this.isProgressVisible,
      accountUiModel: accountUiModel ?? this.accountUiModel,
    );
  }
}
