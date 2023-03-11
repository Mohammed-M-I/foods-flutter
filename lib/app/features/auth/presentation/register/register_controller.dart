import 'package:foods/app/core/error/export_error.dart';
import 'package:foods/app/core/storage/app_storage.dart';
import 'package:foods/app/core/utils/app_alert_utils.dart';
import 'package:foods/app/core/values/export/export_values.dart';
import 'package:foods/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../domain/entities/login_data.dart';
import '../../domain/use_cases/login_use_case.dart' as login_use_case;
import '../../domain/use_cases/register_use_case.dart' as register_use_case;
import 'ui/register_ui_event.dart';
import 'ui/regsiter_ui_state.dart';

class RegisterController extends GetxController {
  //region State

  final state = RegisterUiState.defaultObj().obs;

  //endregion State

  //region Use Cases

  final register_use_case.RegisterUseCase _registerUseCase;
  final login_use_case.LoginUseCase _loginUseCase;

  //endregion Use Cases

  //region Constructors

  RegisterController({
    required register_use_case.RegisterUseCase registerUseCase,
    required login_use_case.LoginUseCase loginUseCase,
  })  : _registerUseCase = registerUseCase,
        _loginUseCase = loginUseCase;

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
    } else if (event is LoginEvent) {
      _login(
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
      register_use_case.Params(
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
        // AppAlertUtils.showSnackBar(
        //   title: AppStrings.alertSuccess.tr,
        //   message: AppStrings.alertSuccess.tr,
        //   backgroundColor: AppColors.green,
        // );

        state(
          state().copyWith(
            isLoading: false,
          ),
        );

        on(
          event: LoginEvent(
            phoneNumber: event.phoneNumber,
            password: event.password,
          ),
        );
      },
    );
  }

  void _login({
    required LoginEvent event,
  }) async {
    state(
      state().copyWith(
        isLoading: true,
      ),
    );

    final result = await _loginUseCase.call(
      login_use_case.Params(
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
      (LoginData data) async {
        // AppAlertUtils.showSnackBar(
        //   title: AppStrings.alertSuccess.tr,
        //   message: AppStrings.alertSuccess.tr,
        //   backgroundColor: AppColors.green,
        // );

        state(
          state().copyWith(
            isLoading: false,
          ),
        );

        // Store user (LoginData)
        await AppStorage.write(
          AppStorage.isLoggedIn,
          true,
        );

        Get.offAllNamed(
          AppRoutes.main,
        );
      },
    );
  }

  //endregion Private functions for dealing with events

  void _workers() {}

  void _processArguments() {}

//endregion Private functions
}
