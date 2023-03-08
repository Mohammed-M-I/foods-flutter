import 'package:flutter/widgets.dart';

class RegisterUiState {
  var nickNameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var passwordController = TextEditingController();

  late bool isLoading;

  RegisterUiState({
    this.isLoading = false,
  });

  RegisterUiState copyWith({
    bool? isLoading,
  }) {
    final newState = RegisterUiState(
      isLoading: isLoading ?? this.isLoading,
    );
 
    newState.nickNameController = nickNameController;
    newState.phoneNumberController = phoneNumberController;
    newState.passwordController = passwordController;

    return newState;
  }
}
