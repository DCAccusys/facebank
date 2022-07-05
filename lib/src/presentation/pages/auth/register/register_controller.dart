import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'dart:async';

import 'steps/step_1.dart';
import 'steps/step_2.dart';

class RegisterController extends GetxController {
  late StreamSubscription<bool> keyboardSubscription;
  RxBool isKeyboardVisible = false.obs;

  List<Widget> steps = [Step1(), Step2()];
  RxInt _stackIndex = 0.obs;
  RxInt get stackIndex => this._stackIndex;

  /* INIT- Step1 Variables */
  TextEditingController userNameInputText = new TextEditingController();
  RxBool isNextButtonEnabled = false.obs;
  /* END- Step1 Variables */

  @override
  void onReady() {
    var keyboardVisibilityController = KeyboardVisibilityController();

    keyboardVisibilityController.onChange.listen((bool visible) async {
      if (!visible) {
        await Future.delayed(Duration(milliseconds: 100));
      }
      this.isKeyboardVisible.value = visible;
    });

    /* INIT- Step1 Listener */

    userNameInputText.addListener(() {
      this.isNextButtonEnabled.value = this.userNameInputText.text.length != 0;
    });

    /* END- Step1 Listener */
    super.onReady();
  }

  @override
  void onClose() {
    userNameInputText.dispose();
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

}
