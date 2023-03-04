import 'package:get/get.dart';

class LoginController extends GetxController {
  //region State

  //endregion State

  //region Use Cases

  //endregion Use Cases

  //region Constructors

  LoginController();

  //endregion Constructors

  //region Lifecycle

  @override
  InternalFinalCallback<void> get onStart {
    return super.onStart;
  }

  @override
  void onInit() {
    super.onInit();

    _processArguments();

    on();
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

  //region Public function

  void on() {}

  //endregion Public function

  //region Private function

  //region Private function for dealing with events

  //endregion Private function for dealing with events

  void _processArguments() {}

//endregion Private function
}
