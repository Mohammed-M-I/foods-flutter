import 'package:foods/app/core/error/export_error.dart';
import 'package:foods/app/core/utils/app_alert_utils.dart';
import 'package:foods/app/core/values/export/export_values.dart';
import 'package:foods/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../domain/entities/login_data.dart';
import '../../domain/use_cases/login_use_case.dart';
import 'ui/login_ui_event.dart';
import 'ui/login_ui_state.dart';

class LoginController extends GetxController {
  //region State

  final state = LoginUiState().obs;

  //endregion State

  //region Use Cases

  final LoginUseCase _loginUseCase;

  //endregion Use Cases

  //region Constructors

  LoginController({
    required LoginUseCase loginUseCase,
  }) : _loginUseCase = loginUseCase;

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
    required LoginUiEvent event,
  }) {
    if (event is LoginEvent) {
      _login(
        event: event,
      );
    } else if (event is ToRegisterEvent) {
      _toRegister(
        event: event,
      );
    }
  }

  //endregion Public functions

  //region Private functions

  //region Private functions for dealing with events

  void _login({
    required LoginEvent event,
  }) async {
    var validationMessage = '';

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

    final result = await _loginUseCase.call(
      Params(
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
      (LoginData data) {
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

  void _toRegister({
    required ToRegisterEvent event,
  }) async {
    Get.toNamed(
      AppRoutes.register,
    );
  }

  //endregion Private functions for dealing with events

  void _workers() {}

  void _processArguments() {}

//endregion Private functions
}
