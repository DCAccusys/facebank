import 'package:facebank/src/core/app_config.dart';
import 'package:facebank/src/data/models/request/auth_login_request.dart';
import 'package:facebank/src/domain/repositories/auth_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  AuthRepository authRepository;

  LoginController({required this.authRepository});

  TextEditingController userInputController = new TextEditingController();
  TextEditingController passwordInputController = new TextEditingController();

  RxBool _isPasswordVisible = false.obs;
  RxBool get isPasswordVisible => this._isPasswordVisible;

  onSigninButtonClicked() async {
    if (this.userInputController.text.isNotEmpty &&
        this.passwordInputController.text.isNotEmpty) {
      final request = AuthLoginRequest(
        phoneNumber: '0541234567890',
        phoneUdid: '',
        login: this.userInputController.text,
        password: this.passwordInputController.text,
        terminal: 'mobile',
        culture: AppConfig.TEMP_CULTURE,
      );
      final result = await this.authRepository.doLogin(request);
      print('Success');
    } else {
      print('Show input message error');
    }
  }

  changePasswordVisibility() {
    this._isPasswordVisible.value = !this._isPasswordVisible.value;
  }
}
