import 'package:foods/app/core/error/export_error.dart';
import 'package:foods/app/core/utils/app_alert_utils.dart';
import 'package:foods/app/core/values/export/export_values.dart';
import 'package:get/get.dart';

import '../../domain/use_cases/regsiter_use_case.dart';
import 'ui/register_ui_event.dart';
import 'ui/regsiter_ui_state.dart';

class RegisterController extends GetxController {
  //region State

  final state = RegisterUiState.defaultObj().obs;

  //endregion State

  //region Use Cases

  final RegisterUseCase _registerUseCase;

  //endregion Use Cases

  //region Constructors

  RegisterController({
    required RegisterUseCase registerUseCase,
  }) : _registerUseCase = registerUseCase;

  //endregion Constructors

  //region Lifecycle

  @override
  InternalFinalCallback<void> get onStart {
    return super.onStart;
  }

  @override
  void onInit() {
    super.onInit();

    _workers();
    _processArguments();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  InternalFinalCallback<void> get onDelete {
    return super.onDelete;
  }

  //endregion Lifecycle

  //region Public functions

  void on({
    required RegisterUiEvent event,
  }) {
    if (event is RegisterEvent) {
      _register(
        event: event,
      );
    }
  }

  //endregion Public functions

  //region Private functions

  //region Private functions for dealing with events

  void _register({
    required RegisterEvent event,
  }) async {
    var validationMessage = '';

    if (event.nickName.isEmpty) {
      validationMessage += '${AppStrings.nickNameRequired.tr} \n';
    }

    if (event.phoneNumber.isEmpty) {
      validationMessage += '${AppStrings.phoneNumberRequired.tr} \n';
    }

    if (event.password.isEmpty) {
      validationMessage += '${AppStrings.passwordRequired.tr} \n';
    }

    if (validationMessage.isNotEmpty) {
      AppAlertUtils.showSnackBar(
        title: AppStrings.alertWarning.tr,
        message: validationMessage.trim(),
        backgroundColor: AppColors.orange,
      );

      return;
    }

    state(
      state().copyWith(
        isLoading: true,
      ),
    );

    final result = await _registerUseCase.call(
      Params(
        nickName: event.nickName,
        phoneNumber: event.phoneNumber,
        password: event.password,
      ),
    );

    result.fold(
      (Failure failure) {
        AppAlertUtils.showSnackBar(
          title: AppStrings.alertError.tr,
          message: failure.message,
          backgroundColor: AppColors.red,
        );

        state(
          state().copyWith(
            isLoading: false,
          ),
        );
      },
      (_) {
        AppAlertUtils.showSnackBar(
          title: AppStrings.alertSuccess.tr,
          message: AppStrings.alertSuccess.tr,
          backgroundColor: AppColors.green,
        );

        state(
          state().copyWith(
            isLoading: false,
          ),
        );
      },
    );
  }

  //endregion Private functions for dealing with events

  void _workers() {}

  void _processArguments() {}

//endregion Private functions
}
