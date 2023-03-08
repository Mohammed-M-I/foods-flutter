import 'package:flutter/widgets.dart';

class LoginUiState {
  var phoneNumberController = TextEditingController();
  var passwordController = TextEditingController();

  late bool isLoading;

  LoginUiState({
    this.isLoading = false,
  });

  LoginUiState copyWith({
    bool? isLoading,
  }) {
    final newState = LoginUiState(
      isLoading: isLoading ?? this.isLoading,
    );

    newState.phoneNumberController = phoneNumberController;
    newState.passwordController = passwordController;

    return newState;
  }
}
