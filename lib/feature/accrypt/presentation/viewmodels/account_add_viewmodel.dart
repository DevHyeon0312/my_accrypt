import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_accrypt/common/utils/debug_log.dart';
import 'package:my_accrypt/feature/accrypt/domain/enums/account_type.dart';
import 'package:my_accrypt/feature/accrypt/domain/usecases/account_use_case.dart';
import 'package:my_accrypt/feature/accrypt/presentation/mapper/account_ui_model_mapper.dart';
import 'package:my_accrypt/feature/accrypt/presentation/ui_models/account_ui_model.dart';

class AccountAddViewModel extends StateNotifier<AccountAddViewModelState> {
  final AccountUseCase _accountUseCase;

  AccountAddViewModel(
    this._accountUseCase,
  ) : super(AccountAddViewModelState.empty());

  bool hasData() {
    return (state.accountUiModel.userId ?? '').isNotEmpty ||
        (state.accountUiModel.userName ?? '').isNotEmpty ||
        (state.accountUiModel.userPassword ?? '').isNotEmpty ||
        (state.accountUiModel.groupName ?? '').isNotEmpty ||
        (state.accountUiModel.siteName ?? '').isNotEmpty ||
        (state.accountUiModel.siteUrl ?? '').isNotEmpty ||
        (state.accountUiModel.note ?? '').isNotEmpty;
  }

  void updateAccount({
    String? userId,
    String? userName,
    String? userPassword,
    String? userPhone,
    String? groupName,
    String? siteName,
    String? siteUrl,
    String? note,
  }) {
    var accountUiModel = state.accountUiModel.copyWith(
      userId: userId ?? state.accountUiModel.userId ?? '',
      userName: userName ?? state.accountUiModel.userName ?? '',
      userPassword: userPassword ?? state.accountUiModel.userPassword ?? '',
      userPhone: userPhone ?? state.accountUiModel.userPhone ?? '',
      groupName: groupName ?? state.accountUiModel.groupName ?? '',
      siteName: siteName ?? state.accountUiModel.siteName ?? '',
      siteUrl: siteUrl ?? state.accountUiModel.siteUrl ?? '',
      note: note ?? state.accountUiModel.note ?? '',
    );
    state = state.copyWith(accountUiModel: accountUiModel);
  }

  Future<bool> saveAccount(AccountType accountType) async {
    DebugLog.d('AccountAddViewModel saveAccount');
    state = state.copyWith(isProgressVisible: true);
    await Future.delayed(const Duration(milliseconds: 1300));
    final accountUiModel = AccountUiModel(
      accountType: accountType,
      userId: state.accountUiModel.userId ?? '',
      userName: state.accountUiModel.userName ?? '',
      userPassword: state.accountUiModel.userPassword ?? '',
      userPhone: state.accountUiModel.userPhone ?? '',
      groupName: state.accountUiModel.groupName ?? '',
      siteName: state.accountUiModel.siteName ?? '',
      siteUrl: state.accountUiModel.siteUrl ?? '',
      note: state.accountUiModel.note ?? '',
      createdAt: DateTime.now().toString(),
      updatedAt: null,
    );

    var isValid = await _accountUseCase.isAccountValid(
      accountEntity: accountUiModel.toEntity(),
    );
    if (!isValid) {
      state = state.copyWith(isProgressVisible: false);
      return false;
    }

    DebugLog.i('AccountAddViewModel saveAccount: $accountUiModel');
    return await _accountUseCase.saveAccount(
      accountEntity: accountUiModel.toEntity(),
    ).then((value) {
      DebugLog.i('AccountAddViewModel saveAccount: true');
      return true;
    }).catchError((error) {
      DebugLog.e('AccountAddViewModel saveAccount catchError: $error');
      return false;
    }).whenComplete(() {
      DebugLog.i('AccountAddViewModel saveAccount whenComplete');
      state = state.copyWith(isProgressVisible: false);
    });
  }

  @override
  void dispose() {
    DebugLog.d('AccountAddViewModel dispose');
    super.dispose();
  }
}

class AccountAddViewModelState {
  bool isProgressVisible;
  AccountUiModel accountUiModel;

  AccountAddViewModelState({
    required this.isProgressVisible,
    required this.accountUiModel,
  });

  factory AccountAddViewModelState.empty() {
    return AccountAddViewModelState(
      isProgressVisible: false,
      accountUiModel: AccountUiModel(
        uuid: null,
        userId: '',
        accountType: AccountType.unknown,
        userName: '',
        userPassword: '',
        groupName: '',
        userPhone: '',
        siteName: '',
        siteUrl: '',
        note: '',
        createdAt: '',
        updatedAt: '',
      ),
    );
  }

  AccountAddViewModelState copyWith({
    bool? isProgressVisible,
    AccountUiModel? accountUiModel,
  }) {
    return AccountAddViewModelState(
      isProgressVisible: isProgressVisible ?? this.isProgressVisible,
      accountUiModel: accountUiModel ?? this.accountUiModel,
    );
  }
}
