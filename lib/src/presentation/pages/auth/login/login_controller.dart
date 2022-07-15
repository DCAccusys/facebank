import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController userInputController = new TextEditingController();
  TextEditingController passwordInputController = new TextEditingController();

  RxBool _isPasswordVisible = false.obs;
  RxBool get isPasswordVisible => this._isPasswordVisible;

  onSigninButtonClicked() {
    if (this.userInputController.text.isNotEmpty &&
        this.passwordInputController.text.isNotEmpty) {
    } else {
      print('Show input message error');
    }
  }

  changePasswordVisibility() {
    this._isPasswordVisible.value = !this._isPasswordVisible.value;
  }
}
