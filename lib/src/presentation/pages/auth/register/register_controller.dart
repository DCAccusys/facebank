import 'package:facebank/src/presentation/pages/auth/register/steps/step_3.dart';
import 'package:facebank/src/presentation/pages/auth/register/steps/step_4.dart';
import 'package:facebank/src/presentation/pages/auth/register/steps/step_5.dart';
import 'package:facebank/src/presentation/pages/auth/register/steps/step_6.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'dart:async';

import 'steps/step_1.dart';
import 'steps/step_2.dart';

class RegisterController extends GetxController {
  late StreamSubscription<bool> keyboardSubscription;

  List<Widget> steps = [
    Step1(),
    Step2(),
    Step3(),
    Step4(),
    Step5(),
    Step6(),
  ];
  RxInt _stackIndex = 0.obs;
  RxInt get stackIndex => this._stackIndex;

  /* INIT- Step1 Variables */
  TextEditingController userNameInputText = new TextEditingController();
  RxBool isNextButtonEnabled = false.obs;
  RxBool isKeyboardVisible = false.obs;
  /* END- Step1 Variables */

  /* INIT- Step2 Variables */
  TextEditingController emailInputText = new TextEditingController();
  TextEditingController idNumerInputText = new TextEditingController();
  TextEditingController accountNumberInputText = new TextEditingController();
  TextEditingController firstPetInputText = new TextEditingController();
  MaskTextInputFormatter get accountNumberFormatter =>
      new MaskTextInputFormatter(
        mask: '#-###-#######-#',
        filter: {"#": RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.lazy,
      );
  RxBool isNextButton2Enabled = false.obs;
  /* END- Step2 Variables */

  /* INIT- Step3 Variables */
  TextEditingController tempPasswordInputText = new TextEditingController();
  RxBool isPasswordVisible = false.obs;
  RxBool isKeyboard3Visible = false.obs;
  RxBool isNextButton3Enabled = false.obs;
  /* END- Step3 Variables */

  /* INIT- Step4 Variables */
  TextEditingController newPasswordInputText = new TextEditingController();
  TextEditingController confirmPasswordInputText = new TextEditingController();
  RxBool isNewPasswordVisible = false.obs;
  RxBool isConfirmPasswordVisible = false.obs;
  RxBool isNextButton4Enabled = false.obs;
  /* END- Step4 Variables */

  /* INIT- Step5 Variables */
  TextEditingController imageAliasInputText = new TextEditingController();
  RxBool isImageAliasVisible = false.obs;
  RxBool isNextButton5Enabled = false.obs;
  /* END- Step5 Variables */

  @override
  void onReady() {
    var keyboardVisibilityController = KeyboardVisibilityController();

    keyboardVisibilityController.onChange.listen((bool visible) async {
      if (!visible) {
        await Future.delayed(Duration(milliseconds: 100));
      }
      this.isKeyboardVisible.value = visible;
      this.isKeyboard3Visible.value = visible;
    });

    /* INIT- Step1 Listener */

    userNameInputText.addListener(() {
      this.isNextButtonEnabled.value = this.userNameInputText.text.isNotEmpty;
    });

    /* END- Step1 Listener */

    /* INIT- Step2 Listener */

    emailInputText.addListener(verifyIsFormComplete);
    idNumerInputText.addListener(verifyIsFormComplete);
    accountNumberInputText.addListener(verifyIsFormComplete);
    firstPetInputText.addListener(verifyIsFormComplete);

    /* END- Step2 Listener */

    /* INIT- Step3 Listener */

    tempPasswordInputText.addListener(() {
      this.isNextButton3Enabled.value =
          this.tempPasswordInputText.text.isNotEmpty;
    });

    /* END- Step3 Listener */
    /* INIT- Step4 Listener */

    newPasswordInputText.addListener(verifyIfPasswordHadSame);
    confirmPasswordInputText.addListener(verifyIfPasswordHadSame);

    /* END- Step4 Listener */

    /* INIT- Step5 Listener */

    imageAliasInputText.addListener(() {
      this.isNextButton5Enabled.value =
          this.imageAliasInputText.text.isNotEmpty;
      print('button 5 -> ${this.isNextButton5Enabled.value}');
    });

    /* END- Step5 Listener */
    super.onReady();
  }

  @override
  void onClose() {
    userNameInputText.dispose();
    emailInputText.dispose();
    idNumerInputText.dispose();
    accountNumberInputText.dispose();
    firstPetInputText.dispose();
    tempPasswordInputText.dispose();
    newPasswordInputText.dispose();
    confirmPasswordInputText.dispose();
    imageAliasInputText.dispose();
    keyboardSubscription.cancel();
    super.onClose();
  }

  // Common functions
  bool backButtonClicked() {
    if (this._stackIndex.value != 0) {
      this._stackIndex.value--;
      return false;
    } else {
      return true;
    }
  }

  void _nextIndex() {
    if (this._stackIndex.value < steps.length - 1) {
      this._stackIndex.value++;
    }
  }

  /* INIT- Step1 methods */
  void nextButtonClicked() {
    this._nextIndex();
  }

  void returnToLoginPage() {
    print('Return to login page');
  }

  /* END- Step1 methods */

  /* INIT- Step2 methods */
  void nextButton2Clicked() {
    this._nextIndex();
  }

  void verifyIsFormComplete() {
    this.isNextButton2Enabled.value = emailInputText.text.isNotEmpty &&
        idNumerInputText.text.isNotEmpty &&
        accountNumberInputText.text.isNotEmpty &&
        firstPetInputText.text.isNotEmpty;
  }

  /* END- Step2 methods */

  /* INIT- Step3 methods */
  void changePasswordStateVisibility() {
    this.isPasswordVisible.value = !this.isPasswordVisible.value;
  }

  void resendTempPassword() {
    print('Resend password');
  }

  void nextButton3Clicked() {
    this._nextIndex();
  }
  /* END- Step3 methods */

  /* INIT- Step4 methods */
  void verifyIfPasswordHadSame() {
    this.isNextButton4Enabled.value = this
            .newPasswordInputText
            .text
            .isNotEmpty &&
        this.confirmPasswordInputText.text.isNotEmpty &&
        (this.newPasswordInputText.text == this.confirmPasswordInputText.text);
  }

  void changeConfirmPasswordVisible() {
    this.isConfirmPasswordVisible.value = !this.isConfirmPasswordVisible.value;
  }

  void changeNewPasswordVisible() {
    this.isNewPasswordVisible.value = !this.isNewPasswordVisible.value;
  }

  /* END- Step4 methods */

  /* INIT- Step5 methods */
  void changeImageAliasVisible() {
    this.isImageAliasVisible.value = !this.isImageAliasVisible.value;
  }

  /* END- Step5 methods */

}
