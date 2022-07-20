import 'package:facebank/src/core/app_config.dart';
import 'package:facebank/src/core/common_functions.dart';
import 'package:facebank/src/core/key_storage.dart';
import 'package:facebank/src/data/datasource/local/secure_storage_service.dart';
import 'package:facebank/src/data/models/request/login_request.dart';
import 'package:facebank/src/data/models/request/validate_existing_alias_request.dart';
import 'package:facebank/src/domain/repositories/security_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../image_alias_otp/image_alias_binding.dart';
import '../image_alias_otp/image_alias_page.dart';

class LoginController extends GetxController {

  ISecurityRepository securityRepository;

  LoginController({required this.securityRepository});

  TextEditingController userInputController = new TextEditingController();
  TextEditingController passwordInputController = new TextEditingController();

  RxBool _isPasswordVisible = false.obs;
  RxBool get isPasswordVisible => this._isPasswordVisible;

  @override
  void onReady() {
    this.userInputController.text = 'op048789';
    this.passwordInputController.text = '123ewq';
    super.onReady();
  }

  onSigninButtonClicked() async {
    // Get encrypted password
    final password = await CommonFunctions.encryptPasswordOrAlias(
        this.passwordInputController.text);
    final storage = await SecureStorageService.sss.secureStorage;
    final phoneUdid = await storage.read(key: KeyStorage.UDID) ?? '';

    final request = LoginRequest(
      phoneNumber: '0541234567890',
      phoneUdid: phoneUdid,
      login: this.userInputController.text,
      password: password,
      terminal: 'term-cell',
      culture: AppConfig.TEMP_CULTURE,
    );

    final response = await this.securityRepository.login(request);

    if (response != null) {
      if (response.success) {
        await _validateExistingAlias(
          request.login,
          phoneUdid,
          request.phoneNumber,
        );

        Get.to(
          () => ImageAliasOTPPage(),
          binding: ImageAliasOTPBinding(),
          transition: Transition.rightToLeft,
        );
      } else {
        // TODO: USER OR PASSWORD NOT VALID
      }
    } else {
      // TODO: SERVER ERROR
    }
  }

  changePasswordVisibility() {
    this._isPasswordVisible.value = !this._isPasswordVisible.value;
  }

  Future<void> _validateExistingAlias(
      String userName, String phoneUdid, String phoneNumber) async {
    final request = ValidateExistingAliasRequest(
      phoneNumber: phoneNumber,
      phoneUdid: phoneUdid,
      userName: userName,
      culture: AppConfig.TEMP_CULTURE,
    );

    await securityRepository.validateExistingAlias(request);
  }
}
