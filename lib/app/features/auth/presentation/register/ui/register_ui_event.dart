abstract class RegisterUiEvent {
  factory RegisterUiEvent.register({
    required String nickName,
    required String phoneNumber,
    required String password,
  }) = RegisterEvent;
}

class RegisterEvent implements RegisterUiEvent {
  final String nickName;
  final String phoneNumber;
  final String password;

  RegisterEvent({
    required this.nickName,
    required this.phoneNumber,
    required this.password,
  });
}
